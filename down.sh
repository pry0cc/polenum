#!/bin/bash

fleet="darwin"

for name in $(axiom-ls $fleet | cut -d ":" -f 2)
do 
    mkdir -p output/name/
    echo "Pulling from $name"
    axiom-scp $name:~/output ./output/name/
done
