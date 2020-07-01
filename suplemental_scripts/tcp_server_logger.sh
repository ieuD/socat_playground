#!/bin/bash

timestamp=$(date "+%Y.%m.%d-%H.%M.%S.%N")
read str
read -ra VALUES <<< "$str"
echo ${str}
${VALUES[3]}=$timestamp
echo "{TCP}:[${VALUES[*]}][\"${timestamp}\"]" | tee -a ../log/tcplog.txt