#!/bin/bash

socat -d -u UDP-RECVFROM:10001,reuseaddr,fork exec:"../suplemental_scripts/udp_server_logger.sh"