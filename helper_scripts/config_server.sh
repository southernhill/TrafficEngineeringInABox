#!/bin/bash

echo "#################################"
echo "  Running Server Post Config"
echo "#################################"
sudo su

echo "Copy interfaces file to location...."
cp /tmp/interfaces /etc/network/interfaces

echo "Reloading interfaces service...."
service networking reload &> /dev/null

echo "#################################"
echo "   Finished"
echo "#################################"
