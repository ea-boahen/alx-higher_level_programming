#!/bin/bash
#pass a variable in the header of the request
#curl -s -H "X-HolbertonSchool-User-Id: 98" "$1"
curl -s -H "X-School-User-Id: 98" "$1"

