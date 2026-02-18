#!/bin/bash

touch $1
chown nagios:nagios $1
tail -n +1 -F $1
