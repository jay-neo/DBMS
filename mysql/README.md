<div align="center"><h1>MySQL</h1></div>

## mysql shell


Direct Login as root user 
```sh
mysql -u root -p
```

To see the port number
```sql
SHOW GLOBAL VARIABLES LIKE 'PORT';
```

To see all the databases
```sql
SHOW DATABASES;
```

To create a new database
```sql
CREATE DATABASE IF NOT exists <database_name>;
```

List down all user's name
```sql
SELECT user FROM mysql.user;
```

Create a user for a particular server
```sql
CREATE USER <username>@<server_name> IDENTIFIED BY "<password>";
```
example: `CREATE USER jay@localhost IDENTIFIED BY "neoPassword";`

Sow grants for a user
```sql
SHOW GRANTS FOR <username>@<server_name>;
```

Grant all privileges to a user
```sql
GRANT ALL PRIVILEGES ON <database_name>.* TO <username>@<server_name>;
```

Flush privileges to apply the changes immediately
```sql
FLUSH PRIVILEGES;
```

Login into as user
```sh
mysql -u <username> -p
```
