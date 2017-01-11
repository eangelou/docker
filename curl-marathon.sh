#!/bin/bash

HOST=http://haci3.cslab.ece.ntua.gr:8080

curl -X POST ${HOST}/v2/apps -d @$1 -H "Content-type: application/json"
