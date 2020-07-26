#!/bin/bash

# Start a fleet with axiom-fleet darwin -i=10 -t=1
# Wait like a minute and then run this...


# axiom-fleet darwin -i=10 -t=1
# sleep 120

fleet="darwin"
file="domains.txt"
total=$(axiom-ls $fleet | wc -l | awk '{ print $1 }')

./split.sh $file $total

for line in $(axiom-ls $fleet)
do
    i=$(echo $line | cut -d ":" -f 1)
    name=$(echo $line | cut -d ":" -f 2)

        axiom-scp scan.sh $name:~/scan.sh
        axiom-scp tmp/$i.txt $name:~/domains.txt
    sleep 0.4
done

sleep 5

axiom-execb 'interlace -tL ./domains.txt -threads 3 -c "./scan.sh _target_" -vv' "$name*"  -q
