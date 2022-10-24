#!/bin/bash

breakpoint=""
getopts "b:" opt
if [ "$opt" = "b" ]; then
    breakpoint=" --debug-break=$OPTARG"
    shift $((OPTIND-1))
fi

filename=$(basename -- "$1")
filename="${filename%.*}"
riscv64-unknown-linux-gnu-gcc -static -o $filename.out $*
~/Documents/gem5/build/RISCV/gem5.opt --debug-flags=Exec,-ExecThread,FmtTicksOff,-ExecSymbol$breakpoint --redirect-stdout --stdout-file=simout-$filename ~/Documents/gem5/configs/example/se.py -c $filename.out

main_header=$(riscv64-unknown-linux-gnu-objdump -d $filename.out | grep "<${filename}_main>:")
echo $main_header
main_addr=$(echo $main_header | grep -oP "[0-9a-f]{5}(?= <)")
python parse_simu.py m5out/simout-$filename $main_addr

sed -E 's/\(|([0-9]+\))//g' simout-$filename-deps.txt | sort -u
gedit simout-$filename-input.txt
