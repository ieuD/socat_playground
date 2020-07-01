#!/bin/bash

socat -d -u TCP-LISTEN:20002,fork,reuseaddr exec:"../suplemental_scripts/tcp_server_logger.sh"