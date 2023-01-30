#!/bin/bash 
set -e 

FIRST=$1
SECOND=$2
EXPECTED=$3
VERSION=${4:-latest}
SUM=$(docker run  arvubd/adder:${VERSION} $FIRST $SECOND )

if [[ "$SUM" ==  "$EXPECTED" ]]
then 
  echo "Integration Test Succeeded"
else 
  echo "[ERROR] ${FIRST} + ${SECOND} returned ${SUM}, not ${EXPECTED}" 1>&2
  exit 1
fi 

