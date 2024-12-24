#!/bin/bash
if grep -q '5' /etc/default/grub; then
    echo "grub has a timeout of 5 seconds"
else
    echo "grub doesn't have a timeout of 5 seconds"
fi