#!/bin/bash

directory=$1

du -h tests/script2 | sort -d > ${directory}/report.txt