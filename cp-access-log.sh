# Extract phase

echo "Extracting data"

# Extract the columns 1 (timestamp), 2 (latitude), 3 (longitude) and 
# 4 (visitorid)

cut -d"#" -f1-4 web-server-access-log.txt > extracted-data.txt

# Transform phase
echo "Transforming data"

# read the extracted data and replace the colons with commas and
# write it to a csv file
tr "#" "," < extracted-data.txt > transformed-data.csv

# Loading
echo "Loading phase"

# Send the instructions to connect to 'template1' and copy the file to the table 'access_log' through command pipeline.
echo "\c Shell_ETL;\COPY access_log FROM 'C:\Users\Khaled\OneDrive - Elshorouk Academy\Desktop\Shell_ETL\transformed-data.csv' DELIMITERS ',' CSV HEADER;" | psql --username=postgres --host=localhost
