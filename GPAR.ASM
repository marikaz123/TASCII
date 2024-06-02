;GetParam:PROC * rev. B

INCLUDE const.inc

MMUL10  MACRO
        shl al,1
        mov dl,al
        shl al,2
        add al,dl
        ENDM

.MODEL SMALL
.CODE

PUBLIC GetParam
JUMPS

GetParam        PROC
                LOCALS
                mov ax,@DATA
                mov es,ax
                mov si,80h
                cmp BYTE PTR [si],0
                je @@eop
                inc si
findSW:
                lodsb
                cmp al,TAB
                je findSW
                cmp al,SPACE
                je findSW
                cmp al,CR
                je @@eop
                cmp al,SW
                je switch
                jmp @@err

switch:
                lodsb
                or al,20h
                cmp al,'a'
                je caseA
                cmp al,'b'
                je caseB
                cmp al,'f'
                je caseF
                jmp @@err
caseA:
                cmp es:[p],1
                je @@err
                cmp BYTE PTR [si],':'
                jne @@askp
                inc si
        @@askp:
                call @CA2N
                cmp dl,-1
                je @@err
                cmp dl,-2
                je @@a1d
                mov es:[acColor],al
                jmp findSW
         @@a1d:
                mov al,es:[td]
                mov es:[acColor],al
                mov es:[p],1
                dec si
                jmp findSW
caseB:
                cmp es:[p+1],1
                je @@err
                cmp BYTE PTR [si],':'
                jne @@bskp
                inc si
        @@bskp:
                call @CA2N
                cmp dl,-1
                je @@err
                cmp dl,-2
                je @@b1d
                mov es:[bgColor],al
                jmp findSW
         @@b1d:
                mov al,es:[td]
                mov es:[bgColor],al
                mov es:[p+1],1
                dec si
                jmp findSW
caseF:
                cmp es:[p+2],1
                je @@err
                cmp BYTE PTR [si],':'
                jne @@fskp
                inc si
        @@fskp:
                call @CA2N
                cmp dl,-1
                je @@err
                cmp dl,-2
                je @@f1d
                mov es:[fgColor],al
                jmp findSW
         @@f1d:
                mov al,es:[td]
                mov es:[fgColor],al
                mov es:[p+2],1
                dec si
                jmp findSW
@@eop:
                clc
                ret
@@err:
                stc
                ret
GetParam        ENDP

@CA2N           PROC
                LOCALS
                lodsb
                cmp al,'0'
                jb @@err
                cmp al,'9'
                ja @@err
                sub al,'0'
                mov es:[td],al
                lodsb
                cmp al,20h
                jbe @@jmp
                cmp al,'0'
                jb @@err
                cmp al,'9'
                ja @@err
                sub al,'0'
                mov es:[td+1],al
                mov al,es:[td]
                MMUL10
                add al,es:[td+1]
                cmp al,15
                jna @@eop
         @@err:
                mov dl,-1
                ret
         @@jmp:
                mov dl,-2
         @@eop:
                ret
@CA2N           ENDP

.DATA
EXTRN acColor:BYTE,bgColor:BYTE,fgColor:BYTE
p   DB 0,0,0
td  DB 0,0
                END