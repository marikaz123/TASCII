;----------------------------------------------------------------------------
;  * TABLICA ASCII *
;  * TASCII v3.0   *                                        (c)1996 'marikaz'
;----------------------------------------------------------------------------

.MODEL SMALL
.CODE

INCLUDE const.inc
CSHAPE EQU 1Fh ;kursor: blok (cienki: 1F1Fh, nie ma: 2020h)

EXTRN ShowLogo:PROC
EXTRN FillForm:PROC
EXTRN @GACP:PROC
EXTRN GetParam:PROC

JUMPS

Main            PROC
                call GetParam
                mov ax,DGROUP
                mov ds,ax
                jc errParam
                mov ax,0B800h
                mov es,ax
                mov ax,3
                int 10h
                mov ax,1003h
                int 10h
                mov di,0
                mov cx,24*80
                mov ah,bgColor
                shl ah,4
                add ah,fgColor
                mov al,SPACE
                rep stosw
                call DrawInterface
                call TextInterface
                call @GACP
                call @CWZAddr
                mov ah,3  ;kursor
                mov bh,0
                int 10h
                mov ccs,cx
                mov ah,1
                mov cx,CSHAPE
                int 10h
                mov ah,2  ;ustaw kursor
                mov bh,0
                mov dh,5
                mov dl,8
                int 10h
                mov bx,OFFSET cx1
                mov cof,bx
                call UpdateStatus

do:             ;>>
                mov ah,10h
                int 16h
                cmp ah,KESC
                je caseEsc
                cmp ah,KUP
                je caseUp
                cmp ah,KW
                je caseUp
                cmp ah,KDOWN
                je caseDown
                cmp ah,KS
                je caseDown
                cmp ah,KLEFT
                je caseLeft
                cmp ah,KA
                je caseLeft
                cmp ah,KRIGHT
                je caseRight
                cmp ah,KD
                je caseRight
                cmp ah,KF1
                je caseF1
                cmp ah,KF2
                je caseF2
                cmp ah,KF3
                je caseF3
                jmp do
                ;<<
errParam:
                mov dx,OFFSET stx
                mov ah,9
                int 21h
                mov al,2
exit:
                mov ah,4ch
                int 21h

caseUP:
                cmp dh,5
                je ooTab
                mov al,fgColor
                call @AddColorTbl
                dec dh
                call UpdateStatus
                jmp do
caseDown:
                cmp dh,20
                je ooTab
                mov al,fgColor
                call @AddColorTbl
                inc dh
                call UpdateStatus
                jmp do
caseLeft:
                cmp dl,8
                je ooTab
                mov al,fgColor
                call @AddColorTbl
                sub dl,2
                call UpdateStatus
                jmp do
caseRight:
                cmp dl,38
                je ooTab
                mov al,fgColor
                call @AddColorTbl
                add dl,2
                call UpdateStatus
                jmp do
caseF1:
                call ServF1
                jmp do
caseF2:
                call ServF2
                jmp do
caseF3:
                call ServF3
                jmp do
caseEsc:
                mov di,0
                mov ax,0720h
                mov cx,2000
                rep stosw
                mov ah,2
                mov bh,0
                mov dh,2
                mov dl,0
                int 10h
                mov ah,1
                mov cx,ccs
                int 10h
                mov al,0
                jmp exit
ooTab:
                mov di,D_STATUS
                mov BYTE PTR es:[di],'B'
                inc di
                mov al,bgColor
                shl al,4
                add al,CERR
                mov es:[di],al
                inc di
                mov BYTE PTR es:[di],'L'
                inc di
                mov es:[di],al
                jmp do
Main            ENDP

UpdateStatus    PROC
                LOCALS
                mov ah,2
                mov bh,0
                int 10h                  ;akt. kursor
                mov di,D_STATUS          ;akt. status
                mov BYTE PTR es:[di],'O'
                inc di
                mov al,bgColor
                shl al,4
                add al,fgColor
                mov es:[di],al
                inc di
                mov BYTE PTR es:[di],'K'
                inc di
                mov es:[di],al
                mov al,acColor          ;Podswetl znak,kolumbe,rzad
                call @AddColorTbl
                call FillForm
                cmp statF3,1
                jne @@eop
                call ServF3si
         @@eop:
                call UpdateComm
                ret
UpdateStatus    ENDP

UpdateComm      PROC
                LOCALS
                cmp cof,0
                je @@eop

                mov di,C_LINE
                mov ah,fgColor
                shl ah,4
                add ah,bgColor
                mov cx,58   ;dlugosc linii
                mov al,SPACE
                rep stosw
                cmp cof,-1
                je @@e0p

                mov si,cof
                mov di,C_LINE
                call @CopyStr
                mov cof,-1
                ret
         @@e0p:
                mov cof,0
         @@eop:
                ret
UpdateComm      ENDP

@AddColorTbl    PROC
                mov tmp,ax
                xor ax,ax
                mov al,dh
                shl ax,4        ;   . mul 80
                mov bx,ax       ;  .
                shl ax,2        ; .
                add ax,bx       ;.
                xor bx,bx
                mov bl,dl
                add ax,bx
                shl ax,1
                mov di,ax
                mov ax,tmp

                mov bl,bgColor
                shl bl,4
                add al,bl
                mov es:[di+1],al ;
                xor ax,ax        ;kolumna i wiersz
                mov al,dh
                shl ax,4
                mov bx,ax
                shl ax,2
                add ax,bx
                add ax,T_COL
                shl ax,1
                mov di,ax
                mov ax,tmp
                mov bl,bgColor
                shl bl,4
                add al,bl
                mov es:[di+1],al
                add di,2
                mov es:[di+1],al
                mov ax,T_ROW
                shl ax,4
                mov bx,ax
                shl ax,2
                add ax,bx
                xor bx,bx
                mov bl,dl
                add ax,bx
                shl ax,1
                mov di,ax
                mov ax,tmp
                mov bl,bgColor
                shl bl,4
                add al,bl
                mov es:[di+1],al
                ret
@AddColorTbl    ENDP

@CopyStr        PROC
                LOCALS
                push di
         @@cps:
                lodsb
                or al,al   ;NUL?
                jz @@eop
                stosb
                inc di
                jmp @@cps
         @@eop:
                pop di
                ret
@CopyStr        ENDP

@CopyBlock      PROC
                LOCALS
                push di
         @@prb:
                call @CopyStr
                cmp BYTE PTR [si],TRM
                je @@eop
                pop di
                add di,160
                push di
                jmp @@prb
         @@eop:
                pop di
                ret
@CopyBlock      ENDP

@ClrWnd         PROC
                LOCALS
                mov di,T_WND_00
                mov ah,bgColor
                shl ah,4
                add ah,fgColor
                mov tmp,di
                mov cx,9
          @@cw:
                push cx
                mov cx,36
          @@cl:
                mov al,20h
                rep stosw

                mov di,tmp
                add di,80*2
                mov tmp,di
                pop cx
                loop @@cw
                ret
@ClrWnd         ENDP

@AccLine        PROC            ;musi byc podany offset w di
                inc di          ;atrybut
                mov cx,X_WND
                mov al,bgColor
                shl al,4
                add al,acColor
           acl:
                stosb
                inc di
                loop acl
                ret
@AccLine        ENDP

DrawInterface   PROC
                cld
                mov di,I_TOP_BAR
                add di,1
                mov cx,L_BAR
                mov al,fgColor
                shl al,4
                add al,bgColor
           dtb:
                stosb
                inc di
                loop dtb
                mov di,I_BOT_BAR
                add di,1
                mov cx,L_BAR
           dbb:
                stosb
                add di,1
                loop dbb
                sub di,2*16-1            ;korekta na znak
                mov al,SEP_CHR
                stosb
                mov di,H_LINE_1
                mov ah,bgColor
                shl ah,4
                add ah,fgColor
                mov cx,L_BAR
                mov al,HL_CHR
                rep stosw
                mov di,H_LINE_2
                mov cx,L_BAR
                rep stosw
                mov di,H_LINE_4
                mov cx,L_BAR
                rep stosw
                mov di,H_LINE_3
                mov cx,38              ;szer. pr.ramki
                rep stosw
                mov di,H_LINE_1
                mov cx,F_HEIGHT
                mov al,VL_CHR
           vl1:
                push di
                stosw
                pop di
                add di,2*80
                loop vl1
                mov di,V_LINE_2
                mov cx,F_HEIGHT
           vl2:
                push di
                stosw
                pop di
                add di,2*80
                loop vl2
                mov di,V_LINE_3
                mov cx,F_HEIGHT
           vl3:
                push di
                stosw
                pop di
                add di,2*80
                loop vl3
                mov di,V_LINE_4
                mov cx,F_HEIGHT
           vl4:
                push di
                stosw
                pop di
                add di,2*80
                loop vl4
                mov di,V_LINE_5
                mov cx,F_HEIGHT
           vl5:
                push di
                stosw
                pop di
                add di,2*80
                loop vl5
                mov di,H_LINE_1           ;pozostale (rogi itp.)
                mov al,UL_CHR
                mov es:[di],ax
                add di,40*2
                mov es:[di],ax
                mov al,UR_CHR
                sub di,2
                mov es:[di],ax
                add di,38*2
                mov es:[di],ax
                mov al,LS_CHR
                mov di,H_LINE_2
                mov es:[di],ax
                add di,40*2
                mov es:[di],ax
                mov di,H_LINE_3
                mov es:[di],ax
                mov al,RS_CHR
                mov di,H_LINE_2
                add di,39*2
                mov es:[di],ax
                add di,38*2
                mov es:[di],ax
                mov di,H_LINE_3
                add di,37*2
                mov es:[di],ax
                mov al,DL_CHR
                mov di,H_LINE_4
                mov es:[di],ax
                add di,40*2
                mov es:[di],ax
                mov al,DR_CHR
                sub di,2
                mov es:[di],ax
                add di,38*2
                mov es:[di],ax
                mov al,UM_CHR
                mov di,V_LINE_2
                mov es:[di],ax
                mov al,IN_CHR
                add di,2*160
                mov es:[di],ax
                mov al,DM_CHR
                add di,17*160
                mov es:[di],ax
                ret
DrawInterface   ENDP

TextInterface   PROC
                mov di,I_TOP_BAR
                add di,25*2
                mov si,OFFSET heading
                call @CopyStr
                mov di,ROW_1
                add di,49*2
                mov si,OFFSET text0
                call @CopyStr
                mov di,ROW_3
                add di,42*2
                mov si,OFFSET text1
                call @CopyStr
                mov di,ROW_5
                add di,50*2
                mov si,OFFSET text2
                call @CopyStr
                add di,80*2
                mov si,OFFSET text3
                call @CopyStr
                add di,80*2
                mov si,OFFSET text4
                call @CopyStr
                mov di,I_BOT_BAR
                add di,2
                mov si,OFFSET text5
                call @CopyStr
                add di,64*2
                mov si,OFFSET text6
                call @copyStr
                mov di,H_DIG             ;liczby poziomo
                mov al,'0'
                mov cx,10
           hd1:
                stosb
                add di,3
                inc al
                loop hd1
                mov al,'A'
                mov cx,6
           hd2:
                stosb
                add di,3
                inc al
                loop hd2
                mov di,V_DIG             ;pionowo
                mov al,'0'
                mov cx,10
           vd1:
                push di
                stosb
                inc di
                push ax
                mov al,'0'
                stosb
                pop ax
                pop di
                inc al
                add di,80*2
                loop vd1
                mov al,'A'
                mov cx,6
           vd2:
                push di
                stosb
                inc di
                push ax
                mov al,'0'
                stosb
                pop ax
                pop di
                inc al
                add di,2*80
                loop vd2
                mov di,A_TAB
                mov tmp,di
                mov al,0
                mov cx,16
          xRow:
                push cx
                mov cx,16
          pRow:
                stosb
                add di,3
                inc al
                loop pRow
                mov di,tmp
                add di,2*80
                mov tmp,di
                pop cx
                loop xRow
                call ShowLogo
                ret
TextInterface   ENDP

ServF1          PROC
                cmp statF1,1
                jz clrF1
                mov statF1,1
                mov statF2,0
                mov statF3,0
                mov al,fgColor  ;zapal F1 i zgas pozostale F
                shl al,4
                add al,acColor
                mov di,POS_F1
                stosb
                inc di
                stosb
                and al,0f0h
                add al,bgColor
                mov di,POS_F2
                stosb
                inc di
                stosb
                mov di,POS_F3
                stosb
                inc di
                stosb
                call @ClrWnd
                mov di,T_WND_00
                call @AccLine
                mov si,OFFSET _o
                mov di,T_WND_01
                call @CopyBlock
                mov bx,OFFSET cx2
                mov cof,bx
                call UpdateComm
                ret
         clrF1:
                mov statF1,0
                mov al,fgColor
                shl al,4
                add al,bgColor
                mov di,POS_F1
                stosb
                inc di
                stosb
                call @ClrWnd
                call ShowLogo
                call UpdateComm
                ret
ServF1          ENDP

ServF2          PROC
                cmp statF2,1
                je clrF2
                mov statF1,0
                mov statF2,1
                mov statF3,0
                mov al,fgColor
                shl al,4
                add al,acColor
                mov di,POS_F2
                stosb
                inc di
                stosb
                and al,0f0h
                add al,bgColor
                mov di,POS_F1
                stosb
                inc di
                stosb
                mov di,POS_F3
                stosb
                inc di
                stosb
                call @ClrWnd
                mov di,T_WND_00
                call @AccLine
                mov di,T_WND_01
                mov si,OFFSET cwzH
                call @CopyStr
                mov si,sCWZ
                mov di,T_WND_11
                call @CopyBlock
                mov bx,OFFSET cx3
                mov cof,bx
                call UpdateComm
                ret
         ClrF2:
                mov statF2,0
                mov al,fgColor
                shl al,4
                add al,bgColor
                mov di,POS_F2
                stosb
                inc di
                stosb
                call @ClrWnd
                call ShowLogo
                call UpdateComm
                ret
ServF2          ENDP

                INCLUDE _srvf3.asm

@CWZAddr        PROC
                push dx
                mov ah,2
                int 1ah       ;w BCD
                mov dl,dh
                and dx,0fh
                mov bx,dx
                shl bx,1
                mov dx,[cwzA+bx]
                mov sCWZ,dx
                pop dx
                ret
@CWZAddr        ENDP

.DATA
PUBLIC acColor,bgColor,fgColor
PUBLIC buffer0

EXTRN  cwzA:WORD,cwzH:BYTE
EXTRN  stx,_o,cx1,cx2,cx3,cx4

EXTRN  cChr:WORD,stdt:BYTE,extt:BYTE
EXTRN  stdc:BYTE,extc:BYTE,_del
EXTRN  ch33,ch34,ch35,ch36,ch37,ch38,ch39,ch40,ch41,ch42,ch43,ch44,ch45
EXTRN  ch46,ch47,ch58,ch59,ch60,ch61,ch62,ch63,ch64,ch91,ch92,ch93,ch94
EXTRN  ch95,ch96,ch123,ch124,ch125,ch126,ch255

bgColor   DB 0
fgColor   DB 3
acColor   DB 14

statF1    DB 0
statF2    DB 0
statF3    DB 0
statEsc   DB 0

          DB 0            ;flaga
buffer0   DB 8 DUP (?),0

;NAPISY INTERFEJSU
heading   DB 'T A B L I C A    A S C I I',NUL
text0     DB 'I N F O R M A C J E',NUL
text1     DB 'STR. KODOWA:         ZNAK:',NUL
text2     DB 'HEX:',NUL
text3     DB 'DEC:',NUL
text4     DB 'BIN:',NUL
text5     DB '>>',NUL
text6     DB 'F1 F2 F3 ESC',NUL

.DATA?
PUBLIC tmp,cTmp,sCWZ
cTmp      DB ?
tmp       DW ?
sCWZ      DW ?
ccs       DW ?
cof       DW ? ;komunikat (0=nie ma, -1=czysc pole, inna wartosc=ofset
.STACK 100h
               END Main
