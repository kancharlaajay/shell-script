#!/bin/bash

echo "All variables: $@"
echo "Number of variables: $#"
echo "Script-Name: $0"
echo "Present working directory: $PWD"
echo "Which user is running the script: $USER"
echo "Process id of the current script: $$"
echo "Exit status of the previous command: $?"
sleep 60 &
echo "Process id of the last command in background: $!"