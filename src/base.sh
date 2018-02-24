#!/bin/bash

number="$1"
sourceBase="$2"

base="10"
if [[ "$3" != "" ]]; then
    base="$3"
fi
echo "obase=$base; ibase=$sourceBase; $number" | bc
