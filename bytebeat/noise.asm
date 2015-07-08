; noise.asm -- silly bytebeat things in x86 assembly, just to fool around :-)
;
; This was originally documented at https://noisebridge.net/wiki/Bytebeat
;
;				mct and leif, Sun Feb 19 19:08:13 PST 2012
; 
; Build with:
;
;       nasm -felf32 noise.asm
;       ld -melf_i386 -o noise noise.o
;
; Run with:
;
;       ./noise | aplay
;
; Equivalent to:
;        python -c'import sys;[sys.stdout.write(chr((t>>10^t>>(t>>13)%4)%256)) for t in xrange(2**20)]' |aplay

global _start

section .data

section .bss

        var:    resb 1  ; one bye variable

section .text

        ; f(x) = (x >> 10 ^ x>>((x>>13)%4)) % 256

        _start: mov esi, 0

                ;int 3

        .loop: 

                mov edi, esi
                shr edi, 13 ; edi := x >> 13

                mov eax, edi
                cwd
                mov bx, 4
                div bx  ; dx := (x >> 13) % 4

                mov eax, esi
                mov cx, dx
                shr eax, cl   ; eax := x >> ((x >> 13) % 4)

                mov edi, esi
                shr edi, 10   ; edi := x >> 10

                xor eax, edi
                mov [var], al

                mov eax, 4      ; sys_write
                mov ebx, 1      ; stdout
                mov ecx, var    ; buffer
                mov edx, 1      ; length
                int 80h         ; syscall

                inc esi
                jmp .loop
