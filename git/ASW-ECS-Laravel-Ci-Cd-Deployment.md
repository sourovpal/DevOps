name: Project Backend Deployment CI/CD.


on:
  push:
    branches: [deploy]


env:
  AWS_REGION: ap-southeast-1
  ECS_CLUSTER: Projects-ECS
  ECS_SERVICE: Project-Backend-service-bm4jlvvs
  TASK_DEFINITION: task-definition.json
  CONTAINER_NAME: Project-Backend
  TASK_DEFINITION_NAME: Project-Backend
  BUILD_IMAGE: new-build:latest
  ECR_IMAGE: 3282117227895.dkr.ecr.ap-southeast-1.amazonaws.com/Projects/backend:latest


jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Build Docker Image
        run: |
          docker buildx build --platform linux/amd64 -t $BUILD_IMAGE --load .

      - name: Add New Tag to Docker Image
        run: |
          docker tag $BUILD_IMAGE $ECR_IMAGE

      - name: Show All Docker Images
        run: |
          docker images

      - name: RUN Docker Image in Container
        run: |
          docker run -d -p 8080:8000 $BUILD_IMAGE

      - name: Show All Docker Containers (PS)
        run: |
          sleep 10
          docker ps -a

      - name: Container Logs
        run: |
          docker logs $(docker ps -q --filter ancestor=$BUILD_IMAGE)

      - name: Ping Container
        run: |
          curl -I http://localhost:8080

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}

      - name: Login to Amazon ECR
        run: |
          aws ecr get-login-password --region ap-southeast-1 \
          | docker login --username AWS --password-stdin 328211722603.dkr.ecr.ap-southeast-1.amazonaws.com

      - name: Push Docker Image to Amazon ECR
        run: |
          docker push $ECR_IMAGE

      - name: Download current task definition
        run: |
          TASK_DEF_ARN=$(aws ecs describe-services \
            --cluster $ECS_CLUSTER \
            --services $ECS_SERVICE \
            --query "services[0].taskDefinition" \
            --output text)

          aws ecs describe-task-definition \
            --task-definition $TASK_DEF_ARN \
            --query 'taskDefinition | {containerDefinitions: containerDefinitions, family: family, executionRoleArn: executionRoleArn, taskRoleArn: taskRoleArn, networkMode: networkMode, requiresCompatibilities: requiresCompatibilities, cpu: cpu, memory: memory}' \
            > task-definition.json



      - name: Create new task definition revision with new image
        id: task-def-new
        uses: aws-actions/amazon-ecs-render-task-definition@v1
        with:
          task-definition: ${{ env.TASK_DEFINITION }}
          container-name: ${{ env.CONTAINER_NAME }}
          image: ${{ env.ECR_IMAGE }}

      # - name: Deploy to ECS service
      #   uses: aws-actions/amazon-ecs-deploy-task-definition@v2
      #   with:
      #     task-definition: ${{ steps.task-def-new.outputs.task-definition }}
      #     service: ${{ env.ECS_SERVICE }}
      #     cluster: ${{ env.ECS_CLUSTER }}
      #     wait-for-service-stability: true

      - name: Attach latest revision and deploy with zero downtime
        run: |
          LATEST=$(aws ecs describe-task-definition \
            --task-definition ${{ env.TASK_DEFINITION_NAME }} \
            --query "taskDefinition.taskDefinitionArn" \
            --output text)

          aws ecs update-service \
            --cluster $ECS_CLUSTER \
            --service $ECS_SERVICE \
            --task-definition $LATEST \
            --desired-count 2 \
            --deployment-configuration "maximumPercent=200,minimumHealthyPercent=100" \
            --force-new-deployment
