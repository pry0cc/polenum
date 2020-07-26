#!/bin/bash

fleet="darwin"

for name in $(axiom-ls $fleet | cut -d ":" -f 2)
do 
    count=1
    count=$(axiom-exec 'ps cax | grep interlace | wc -l | awk "{ print \$1 }"' $name -q)
    
    if [[ "$count" -gt 0 ]]
    then
        echo "$name is running"
        axiom-scp $name:~/output ./output/name/
    else
        echo "$name is not running"
        axiom-scp $name:~/output ./output/name/
        axiom-rm $name -f
    fi

done
