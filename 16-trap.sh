#!/bin/bash

set -e

trap 'echo "there is an error in $LINENO , Command: $BASH_COMMAND"' ERR

echo "Hello World"
echo "I am learning Shell"
echo "printing error here"
echo "No error in this"