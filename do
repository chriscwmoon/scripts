declare -a nodes=(
node1
node2
)
for i in "${nodes[@]}"
do
    ssh $i $1
done
