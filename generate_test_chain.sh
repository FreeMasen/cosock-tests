#! /bin/bash

COSOCK_DIR="$1"
PREFIX="$2"
OUTSCRIPT="#! /bin/bash"$'\n'

AFTER_FIRST=0
for path in $COSOCK_DIR/test/*/*.lua; do
    if [ "$(basename "$path")" == "perform_test.lua" ]; then
        continue
    fi
    if [ "$AFTER_FIRST" -eq "0" ]; then
        AFTER_FIRST=1
    else
        OUTSCRIPT="$OUTSCRIPT \\"$'\n'
        OUTSCRIPT="$OUTSCRIPT && " 
    fi
    SCRIPT_DIR="$(dirname $path)"
    echo $SCRIPT_DIR
    SCRIPT_DIR_STEM="$(basename $SCRIPT_DIR)"
    echo $SCRIPT_DIR_STEM
    SCRIPT_NAME="$(basename $path)"
    echo $SCRIPT_NAME
    TEST_PATH="/cosock/test/$SCRIPT_DIR_STEM/$SCRIPT_NAME"
    echo $TEST_PATH
    OUTSCRIPT="$OUTSCRIPT$PREFIX lua $TEST_PATH"
done

echo "$OUTSCRIPT" > ./5.1/run_test_chain.sh
echo "$OUTSCRIPT" > ./5.2/run_test_chain.sh
echo "$OUTSCRIPT" > ./5.3/run_test_chain.sh
echo "$OUTSCRIPT" > ./5.4/run_test_chain.sh
