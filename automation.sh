#!/bin/bash

read -p "Enter the URL to download: " url

wget -q --spider "$url"

if [ $? -ne 0 ]; then
    echo "Error: Failed to download the content from the URL."
    exit 1
fi

filename=$(echo "$url" | rev | cut -d'/' -f1 | rev)

wget -q --content-disposition "$url"

if [ $? -ne 0 ]; then
    echo "Error: Failed to download the file from the URL."
    exit 1
fi

file_type=$(file -b --mime-type "$filename")

echo "The downloaded file is of type: $file_type"
