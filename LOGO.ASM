;ShowLogo:PROC * rev. A

_DATA SEGMENT WORD PUBLIC 'DATA'
INCLUDE const.inc
EXTRN acColor:BYTE,bgColor:BYTE

pattern DB 01111000b, 01111000b, 01111000b, 11110011b, 11000000b
        DB 11001100b, 11001100b, 11001100b, 01100001b, 10000000b
        DB 11001100b, 11000000b, 11000000b, 01100001b, 10000000b
        DB 11111100b, 01111000b, 11000000b, 01100001b, 10000000b
        DB 11001100b, 00001100b, 11000000b, 01100001b, 10000000b
        DB 11001100b, 11001100b, 11001100b, 01100001b, 10000000b
        DB 11001100b, 01111000b, 01111000b, 11110011b, 11000000b
pData   DW 8,5,7 ;Dane dla petli: 8=przetwarzaj po 8 bitow
                 ;                5=ilosc bajtow na linie
                 ;                7=ilosc linii
_DATA ENDS

_BSS SEGMENT WORD PUBLIC 'BSS'
EXTRN tmp:WORD
_BSS ENDS

_TEXT SEGMENT WORD PUBLIC 'CODE'
DGROUP GROUP _DATA,_BSS
ASSUME cs:_TEXT,ds:DGROUP

PUBLIC ShowLogo

ShowLogo        PROC
                LOCALS
                mov di,T_WND_11
                lea si,pattern
                mov ah,bgColor
                shl ah,4
                add ah,acColor
                mov tmp,di
                mov cx,pData+4
       @@xLine:
                push cx
                mov cx,pData+2
       @@xByte:
                lodsb
                push cx
                mov cx,pData
        @@xBit:
                push cx
                shl al,1
                jnc @@nChr
                push ax
                mov al,L_CHR
                stosw
                pop ax
                pop cx
                loop @@xBit
                jmp @@eBit
        @@nChr:
                add di,2
                pop cx
                loop @@xBit
        @@eBit:
                pop cx
                loop @@xByte
                mov di,tmp
                add di,160
                mov tmp,di
                pop cx
                loop @@xLine
                ret
ShowLogo        ENDP
_TEXT ENDS
                END