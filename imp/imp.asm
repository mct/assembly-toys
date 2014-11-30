; Michael C. Toren <mct@toren.net>
; mct, Sat Sep 20 15:57:03 PDT 2008

global _start

section .bss
        core: resb 4096

section .text
        _start: nop                     ; Makes debugging under gdb easier

        _imp:   cld                     ; Set direction to "up"
                mov edi, core           ; destination index register
                mov ax, [_stosw]        ; load the opcode for "stosw"
        _stosw: stosw
                jmp core
