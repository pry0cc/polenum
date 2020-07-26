#!/bin/bash

domain="$1"

mkdir -p output/
mkdir -p tmp
subfinder -d $domain -o tmp/$domain-subs.txt
amass enum -src -ip -active -brute -df ./tmp/$domain-subs.txt -json output/$domain.json
