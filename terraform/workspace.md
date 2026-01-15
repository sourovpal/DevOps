# Workspace

### Basic Command
```bash
  terraform workspace list        # সব workspace দেখার জন্য
  terraform workspace show        # Current Workspace দেখার জন্য
  terraform workspace new dev     # নতুন Workspace তৈরি জন্য
  terraform workspace select dev  # Workspace Switch / Select
  terraform workspace delete dev  # Delete করার আগে অন্য workspace-এ switch করতে হবে

  # Use tfvers file
  terraform apply -var-file=env/dev.tfvars
  terraform apply -var-file=env/prod.tfvars
```
