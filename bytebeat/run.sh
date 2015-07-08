#!/bin/bash

set -e

if ! test -f noise
then
	echo "Building noise.asm"
	(
		set -x
		nasm -felf32 noise.asm
		ld -melf_i386 -o noise noise.o
		size noise
	)
	echo
	# objdump --disassemble -M intel ./noise
fi

./noise | aplay
