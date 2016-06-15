#!/bin/bash
#to find the process id of 'yum'
#I know we can use pkill!

ps aux | grep $1 | grep -v "grep" | awk '{print $2}' | sort | head -n 1
