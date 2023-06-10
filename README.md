# pg-print-schema
A bash script to export local postgresql database schema with data types in a pretty mark down format

### Requirements:
This script requires your postgresql database configuration to accept md5 password authentication mode for database administrative login by Unix domain socket

### Make the file executable by following
``` sudo chmod +x print-schema.sh ```

### Run the script 
``` sudo ./print-schema.sh ```

### you will get prompts in terminal for for database credentials, after feeding the credentials you should get a file named "database-name.md" in the same direcotry you ran the script from.
### ENJOY! 
