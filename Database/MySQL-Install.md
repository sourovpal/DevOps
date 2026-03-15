# MySQL Install in Linux

### System update
```bash
sudo apt update
```

### MySQL install
```bash
sudo apt install mysql-server -y
```

### MySQL login
```bash
sudo mysql
// ----------- OR ----------
mysql -u root -p
```

### Root authentication change
```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
```
