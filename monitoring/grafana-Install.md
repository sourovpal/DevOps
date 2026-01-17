# Install Grafana

### Install required packages
```bash
  sudo apt update
  sudo apt install -y apt-transport-https software-properties-common wget
```

### Add Grafana GPG key
```bash
  sudo mkdir -p /etc/apt/keyrings
  wget -q -O - https://apt.grafana.com/gpg.key | sudo tee /etc/apt/keyrings/grafana.asc
```

### Add Grafana repository
```bash
  echo "deb [signed-by=/etc/apt/keyrings/grafana.asc] https://apt.grafana.com stable main" \
  | sudo tee /etc/apt/sources.list.d/grafana.list
```

### Install Grafana
```bash
  sudo apt update
  sudo apt install -y grafana

  sudo systemctl daemon-reload
  sudo systemctl start grafana-server
  sudo systemctl enable grafana-server

  sudo systemctl status grafana-server

  http://SERVER_IP:3000
  http://localhost:3000

  # Default Login

  Username: admin
  Password: admin

```
