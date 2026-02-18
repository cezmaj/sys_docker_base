#!/bin/bash

touch $1
tail -n +1 -F $1
