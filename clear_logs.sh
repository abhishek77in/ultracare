#!/bin/bash

for log in `ls ./log/*.log`; do cat /dev/null > "$log"; done
