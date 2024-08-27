# Project Senario🗺

This is a simple basic ETL(Extract,Transform and Load) project using Shell scripts.Extracted required fields from the access log file of a random website.Transform the data into CSV format.Then load the data into a table in a local database using PostgreSQL.

# Tasks📝
- Created a database with a table called access_log
- Extracted required fields from the file.
- Transformed the data into CSV format.
- Loaded the data into the table access_log in PostgreSQL
- Made the database ready for queyring 

# Implementation
- Extract timestamp, latitude, longitude and visitorid which are the first four fields from the file using the "xut" command and  Redirect the extracted output into a file.
```bash
# Extract phase

echo "Extracting data"

# Extract the columns 1 (timestamp), 2 (latitude), 3 (longitude) and 4 (visitorid)

cut -d"#" -f1-4 web-server-access-log.txt > extracted-data.txt

```

- The extracted columns are separated by the original “#” delimiter.We need to convert this into a “,” delimited file.
```bash
# Transform phase

echo "Transforming data"

# read the extracted data and replace the colons with commas and write it to a csv file

tr "#" "," < extracted-data.txt > transformed-data.csv

```
- Load the data into the table access_log in PostgreSQL
```bash
# Send the instructions to connect to 'Shell_ETL' and copy the file to the table 'access_log' through command pipeline.

echo "\c Shell_ETL;\COPY access_log FROM 'C:\Users\Khaled\OneDrive - Elshorouk Academy\Desktop\Shell_ETL\transformed-data.csv' DELIMITERS ',' CSV HEADER;" | psql --username=postgres --host=localhost

```
## Results
![Results](https://github.com/user-attachments/assets/ad7ab583-a92e-4f2d-8a21-6f7fa8846f5f)
