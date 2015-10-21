#!/bin/bash

HOST=http://xenon2.cslab.ece.ntua.gr:8080

curl -X POST ${HOST}/v2/apps -d @$1 -H "Content-type: application/json"
