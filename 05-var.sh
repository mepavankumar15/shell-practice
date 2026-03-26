#!/bin/bash

### special variables ###
echo "all the args passed to script : $@"
echo "number of args passed to script: $#"
echo "script name: $0"
echo "present dir: $PWD"
echo "presnt user : $USER"
echo "Home dir : $HOME"
echo "PID of script: $$"
sleep 10 &
echo "PID of recently exec bg process : $!"
