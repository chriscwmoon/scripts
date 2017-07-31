#!/bin/sh

# Install sshpass
yum install sshpass


# Password for the user trying to have sshless
password=cloudera

# List of nodes
declare -a nodes=(
os-test-{1..5}.vpc.cloudera.com
)

# Key Generation
echo "Generating rsa key ... at ~/.ssh/id_rsa"
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''

# Copy the key to all nodes
echo "Copying the key to all nodes ... "
for i in "${nodes[@]}"
do
    sshpass -p $password ssh-copy-id root@$i
done

# Test

echo "Testing the setup ... "

for i in "${nodes[@]}"
do
    ssh $i hostname
done

echo "-------------------------------------------------------"
echo "  If you see all the hostname without password prompt,"
echo "  it's successfully completed"
echo "-------------------------------------------------------"
