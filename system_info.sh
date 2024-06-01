#!/bin/bash

echo "---> CPU Info:"
cpu_info=$(lscpu | grep -E 'Architecture|CPU\(s\)|Model name|CPU MHz')
echo -e "${cpu_info}\n"

echo "---> Memory usage:"
memory_info=$(free)
echo -e "${memory_info}\n"

echo "---> Disk partitions and usage:"
disk_info=$(df -h)
echo "${disk_info}"
