#!/bin/bash

# Author: Milon Hossain
# Date Created: 22/05/23
# Date Modified: 13/06/23

# Prompt for database credentials
read -p "Enter host name: " host
read -p "Enter database port: " port
read -p "Enter database name: " dbname
read -p "Enter database user: " user
read -s -p "Enter database password: " password
echo
read -p "Enter schema name: " schema

# Connect to the database and retrieve table information
table_info=$(PGPASSWORD=$password psql -h $host -p $port -U $user -d $dbname -t -c \
  "SELECT table_name, column_name, data_type
   FROM information_schema.columns
   WHERE table_schema = '$schema'
   ORDER BY table_name, ordinal_position")

# Generate output file name
output_file="${dbname}_${schema}_schema.md"

# Write table information to Markdown file
prev_table=""
while IFS="|" read -r table column type; do
  if [[ "$table" != "$prev_table" ]]; then
    echo "# $table" >> "$output_file"
    echo "| Column Name | Data Type |" >> "$output_file"
    echo "|-------------|-----------|" >> "$output_file"
    prev_table="$table"
  fi
  echo "| $column | $type |" >> "$output_file"
done <<< "$table_info"

echo "Schema exported successfully to $output_file"
