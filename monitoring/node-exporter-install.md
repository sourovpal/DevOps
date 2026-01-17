# Node Exporter Install

### Download & Install
```bash
  cd /tmp
  wget https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz
  tar xvf node_exporter-1.8.1.linux-amd64.tar.gz
  cd node_exporter-1.8.1.linux-amd64
  sudo cp node_exporter /usr/local/bin/
```

### User Create
```bash
  sudo useradd --no-create-home --shell /bin/false node_exporter
  sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
```

### Systemd Service
```bash
  sudo vim /etc/systemd/system/node_exporter.service

  [Unit]
  Description=Node Exporter
  After=network.target

  [Service]
  User=node_exporter
  ExecStart=/usr/local/bin/node_exporter
  
  [Install]
  WantedBy=default.target 
```

### User Create
```bash
  sudo useradd --no-create-home --shell /bin/false node_exporter
  sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
```

### Start
```bash
  sudo systemctl daemon-reload
  sudo systemctl start node_exporter
  sudo systemctl enable node_exporter

  sudo systemctl status node_exporter
```







