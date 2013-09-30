#!/bin/bash
#to find the process id of 'yum'

ps aux | grep yum | grep -v "grep" | awk '{print $2}' | sort | head -n 1
