#!/bin/bash

nohup socat -u -d TCP4-LISTEN:5001,reuseaddr,fork EXEC:../suplemental_scripts/tcp_forwarder.sh &
nohup socat -u -d UDP-recvfrom:5001,reuseaddr,fork EXEC:../suplemental_scripts/udp_forwarder.sh &

#  socat -u -d TCP-LISTEN:5001,fork,reuseaddr SYSTEM:"../suplemental_scripts/tcp_forwarder.sh" || socat -u UDP-recv:5001,fork,reuseaddr SYSTEM:"../suplemental_scripts/udp_forwarder.sh"