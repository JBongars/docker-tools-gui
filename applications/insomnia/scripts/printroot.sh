#!/bin/sh

set -eu
set -o pipefail

find ../root -type f -name "run" | while read -r file; do
    echo "
# ---
# $file
# ---" && cat $file    
done

