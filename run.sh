#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
colorDiff="s/^-/\x1b[31m-/;s/^+/\x1b[32m+/;s/^@/\x1b[34m@/;s/$/\x1b[0m/"

cd $dir
set -o pipefail

for f in *.glsl; do

    printf "Comparing output with %s: \n" ${f%%.*}.out  
    
    if  diff -uw <(../glc <$f 2>&1 ) ${f%%.*}.out | sed $colorDiff ; then
        printf "${GREEN}PASS${NC}\n"
    else
        printf "${RED}FAIL${NC} (${GREEN}+Reference output ${RED}-Your output${NC})\n"    
    fi
   
done



