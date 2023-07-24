@echo off
tools\vasm -quiet -no-opt -devpac -Fhunk -o game\driller.o src\driller.asm
tools\vlink -S -s -o game\driller game\driller.o
del game\driller.o
