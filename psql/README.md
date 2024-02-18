<div align="center"><h1>PostgreSQL</h1></div>


## psql shell

Direct Login as root user 
```sh
psql -U postgres
```

To see the port number
```sql
SHOW port;
```

To see all the databases
```sql
\l
```

To create a new database
```sql
CREATE DATABASE <database_name>;
```

List down all user's name
```sql
\du
```

Create a user
```sql
CREATE USER <username> WITH ENCRYPTED PASSWORD '<password>';  
```

Grant all privileges to a user
```sql
GRANT ALL PRIVILEGES ON DATABASE <database_name> TO <username>;
```

Commit to apply the changes
```sql
COMMIT;
```

Login into as user
```sh
psql -d <database_name> -U <username>
```


**Must step to operation on public schema for other user**

1. Login as "postgresql" to that particular database
```sql
psql -d <database_name> -U postgresss
```

2. Grant to operation on public schema
```sql
GRANT ALL ON SCHEMA public TO <username>;
```

3. Exit
```sql
/q
```

