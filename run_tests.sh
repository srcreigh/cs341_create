#!/bin/bash

if [ $# -lt 1 ]; then
  echo "usage: ./run_tests.sh <executable_name>"
  exit 1
fi

EXEC="$1"
TMP='tmp'

PASSED=0
FAILED=0

echo
for IN in `ls tests/*.in`; do
  BASE=`echo ${IN} | sed -e 's/\.in//g'`
  OUT="$BASE.out"

  # run the test
  echo "running $BASE..."
  ./${EXEC} < ${IN} > $TMP

  # return false if the output files are different
  diff $TMP $OUT > /dev/null
  if [ $? -ne 0 ]; then
    echo
    echo "failed: $BASE"
    echo "input: `cat ${IN}`"
    echo "expect: `cat ${OUT}`"
    echo "actual: `cat ${TMP}`" 
    echo
    ((FAILED++))
  else
    ((PASSED++))
  fi
done

# print stats
echo
echo "$PASSED passed"
echo "$FAILED failed"
echo

rm ${TMP}
