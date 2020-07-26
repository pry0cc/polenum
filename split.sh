#!/bin/bash

file="$1"
total="$2"

lines=$(wc -l $file | awk '{ print $1 }')
lines_per_file=$(bc <<< "scale=2; $lines / $total" | awk '{print int($1+0.5)}')

rm -rf tmp
mkdir -p tmp
cp $file tmp/$file
cd tmp/
split -d -l $lines_per_file $file
rm $file
i=0
for f in $(bash -c "ls"); do i=$((i+1)); mv $f $i.txt; done
cd ..
