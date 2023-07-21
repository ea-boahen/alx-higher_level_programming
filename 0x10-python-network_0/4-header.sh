#!/bin/bash
#pass a variable in the header of the request
#!/bin/bash

# Function to check if the provided URL is valid
is_valid_url() {
    local url=$1
    if curl -s --head --request GET "$url" | grep "HTTP/1.1 200 OK" > /dev/null; then
        return 0
    else
        return 1
    fi
}

# Check if a URL is provided as an argument
if [ $# -eq 0 ]; then
    echo "Error: Please provide a URL as an argument."
    exit 1
fi

# The URL to send the GET request to
url=$1

# Validate the URL
if ! is_valid_url "$url"; then
    echo "Error: Invalid URL or unable to reach the URL."
    exit 1
fi

# The header variable and its value
header="X-School-User-Id: 98"

# Send the GET request using curl with the header
response=$(curl -s -H "$header" "$url")

# Check if the request was successful (HTTP status code 200)
if [ $? -eq 0 ]; then
    # Display the body of the response
    echo "Response Body:"
    echo "$response"
else
    echo "Error: Unable to fetch the URL. Please check the URL and try again."
fi

