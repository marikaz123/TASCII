;FillForm:PROC * rev. A

.MODEL SMALL
.CODE

INCLUDE const.inc

PUBLIC FillForm,@GACP

FillForm        PROC
                push dx
                call @GACH
                call @WHEX
                call @WDEC
                call @WBIN
                pop dx
                ret
FillForm        ENDP

@GACH           PROC       ;ZNAK
                mov ah,8
                mov bx,0
                int 10h
                mov cTmp,al
                mov di,D_CHAR
                mov es:[di],al
                mov al,bgColor
                shl al,4
                add al,acColor
                mov es:[di+1],al
                ret
@GACH           ENDP

@GACP           PROC       ;AKTYWNA STRONA KODOWA
                LOCALS
                push dx
                mov ax,3000h
                int 21h
                cmp al,3
                ja @@cp
                cmp ah,30  ;tylko MS-DOS v3.30+
                jb @@na
          @@cp:
                mov ax,6601h
                int 21h
                jc @@na
                lea di,buffer0
                mov ax,bx
                mov bx,10
          @@dv:
                xor dx,dx
                div bx
                add dl,'0'
                mov [di],dl
                inc di
                or ax,ax
                jnz @@dv
                mov si,di
                dec si      ;korekta
                mov di,D_CP
                mov ah,bgColor
                shl ah,4
                add ah,acColor
          @@wr:
                mov al,[si]
                mov es:[di],ax
                dec si
                add di,2
                cmp BYTE PTR [si],0
                jne @@wr
                jmp @@ex
          @@na:
                mov ah,bgColor
                shl ah,4
                add ah,acColor
                mov di,D_CP
                mov al,'N'
                mov es:[di],ax
                add di,2
                mov al,'/'
                mov es:[di],ax
                add di,2
                mov al,'A'
                mov es:[di],ax
          @@ex:
                pop dx
                ret
@GACP           ENDP

@WHEX           PROC
                LOCALS
                mov di,D_HEX
                mov al,20h
                stosb
                inc di
                stosb
                lea di,buffer0
                xor ax,ax
                mov al,cTmp
                xor dx,dx
                mov bx,16
                div bx
                cmp dl,9
                ja @@a1
                add dl,'0'
                mov [di],dl
                jmp @@2d
          @@a1:
                add dl,'7'
                mov [di],dl
          @@2d:
                or al,al
                jz @@wr
                inc di
                cmp al,9
                ja @@a2
                add al,'0'
                mov [di],al
                jmp @@wr
          @@a2:
                add al,'7'
                mov [di],al
          @@wr:
                mov si,di
                mov di,D_HEX
                mov ah,bgColor
                shl ah,4
                add ah,acColor
          @@xd:
                mov al,[si]
                mov es:[di],ax
                add di,2
                dec si
                cmp BYTE PTR [si],0
                jne @@xd
                ret
@WHEX           ENDP

@WDEC           PROC
                LOCALS
                mov di,D_DEC
                mov cx,3
                mov al,20h
          @@cl:
                stosb
                inc di
                loop @@cl
                lea di,buffer0
                xor ax,ax
                mov al,cTmp
                mov bx,10
          @@dv:
                xor dx,dx
                div bx
                add dl,'0'
                mov [di],dl
                inc di
                or ax,ax
                jnz @@dv
                dec di   ;korekta
                mov si,di
                mov di,D_DEC
                mov ah,bgColor
                shl ah,4
                add ah,acColor
          @@wr:
                mov al,[si]
                mov es:[di],ax
                dec si
                add di,2
                cmp BYTE PTR [si],0
                jne @@wr
                ret
@WDEC           ENDP

@WBIN           PROC
                LOCALS
                mov di,D_BIN
                mov cx,8
                mov al,20h
          @@cl:
                stosb
                inc di
                loop @@cl
                mov ah,bgColor
                shl ah,4
                add ah,acColor
                mov di,D_BIN
                mov bl,cTmp
                cmp bl,0
                jne @@gb
                mov al,'0'
                stosw
                ret
          @@gb:
                mov cx,8
          @@sk:
                shl bl,1
                jc @@f1
                loop @@sk
          @@f1:
                mov al,'1'
                stosw
                dec cx
                jz @@ex
          @@xb:
                shl bl,1
                jc @@on
                mov al,'0'
                stosw
                loop @@xb
                jmp @@ex
          @@on:
                mov al,'1'
                stosw
                loop @@xb
          @@ex:
                ret
@WBIN           ENDP

.DATA
EXTRN acColor:BYTE,bgColor:BYTE
EXTRN buffer0:BYTE

.DATA?
EXTRN cTmp:BYTE
                END