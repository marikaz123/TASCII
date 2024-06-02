;ServF3:PROC (inc)

ServF3          PROC
                LOCALS
                cmp statF3,1
                je clrF3
                mov statF1,0
                mov statF2,0
                mov statF3,1
                mov al,fgColor
                shl al,4
                add al,acColor
                mov di,POS_F3
                stosb
                inc di
                stosb
                and al,0f0h
                add al,bgColor
                mov di,POS_F1
                stosb
                inc di
                stosb
                mov di,POS_F2
                stosb
                inc di
                stosb
ServF3si:
                mov bx,OFFSET cx4
                mov cof,bx
                call UpdateComm
                xor ax,ax
                xor bx,bx
                mov al,cTmp
                cmp al,0
                ja @@c1
                call @DisplayCCI
                ret
          @@c1:
                cmp al,1
                ja @@c2
                call @DisplayCCI
                ret
          @@c2:
                cmp al,2
                ja @@c3
                call @DisplayCCI
                ret
          @@c3:
                cmp al,3
                ja @@c4
                call @DisplayCCI
                ret
          @@c4:
                cmp al,4
                ja @@c5
                call @DisplayCCI
                ret
          @@c5:
                cmp al,5
                ja @@c6
                call @DisplayCCI
                ret
          @@c6:
                cmp al,6
                ja @@c7
                call @DisplayCCI
                ret
          @@c7:
                cmp al,7
                ja @@c8
                call @DisplayCCI
                ret
          @@c8:
                cmp al,8
                ja @@c9
                call @DisplayCCI
                ret
          @@c9:
                cmp al,9
                ja @@c10
                call @DisplayCCI
                ret
         @@c10:
                cmp al,10
                ja @@c11
                call @DisplayCCI
                ret
         @@c11:
                cmp al,11
                ja @@c12
                call @DisplayCCI
                ret
         @@c12:
                cmp al,12
                ja @@c13
                call @DisplayCCI
                ret
         @@c13:
                cmp al,13
                ja @@c14
                call @DisplayCCI
                ret
         @@c14:
                cmp al,14
                ja @@c15
                call @DisplayCCI
                ret
         @@c15:
                cmp al,15
                ja @@c16
                call @DisplayCCI
                ret
         @@c16:
                cmp al,16
                ja @@c17
                call @DisplayCCI
                ret
         @@c17:
                cmp al,17
                ja @@c18
                call @DisplayCCI
                ret
         @@c18:
                cmp al,18
                ja @@c19
                call @DisplayCCI
                ret
         @@c19:
                cmp al,19
                ja @@c20
                call @DisplayCCI
                ret
         @@c20:
                cmp al,20
                ja @@c21
                call @DisplayCCI
                ret
         @@c21:
                cmp al,21
                ja @@c22
                call @DisplayCCI
                ret
         @@c22:
                cmp al,22
                ja @@c23
                call @DisplayCCI
                ret
         @@c23:
                cmp al,23
                ja @@c24
                call @DisplayCCI
                ret
         @@c24:
                cmp al,24
                ja @@c25
                call @DisplayCCI
                ret
         @@c25:
                cmp al,25
                ja @@c26
                call @DisplayCCI
                ret
         @@c26:
                cmp al,26
                ja @@c27
                call @DisplayCCI
                ret
         @@c27:
                cmp al,27
                ja @@c28
                call @DisplayCCI
                ret
         @@c28:
                cmp al,28
                ja @@c29
                call @DisplayCCI
                ret
         @@c29:
                cmp al,29
                ja @@c30
                call @DisplayCCI
                ret
         @@c30:
                cmp al,30
                ja @@c31
                call @DisplayCCI
                ret
         @@c31:
                cmp al,31
                ja @@c32
                call @DisplayCCI
                ret
         @@c32:
                cmp al,32
                ja @@ch33
                call @DisplayCCI
                ret
;----------------------------------------------
        @@ch33:
                cmp al,33
                jne @@ch34
                mov si,OFFSET ch33
                call @DisplayCSX
                ret
        @@ch34:
                cmp al,34
                jne @@ch35
                mov si,OFFSET ch34
                call @DisplayCSX
                ret
        @@ch35:
                cmp al,35
                jne @@ch36
                mov si,OFFSET ch35
                call @DisplayCSX
                ret
        @@ch36:
                cmp al,36
                jne @@ch37
                mov si,OFFSET ch36
                call @DisplayCSX
                ret
        @@ch37:
                cmp al,37
                jne @@ch38
                mov si,OFFSET ch37
                call @DisplayCSX
                ret
        @@ch38:
                cmp al,38
                jne @@ch39
                mov si,OFFSET ch38
                call @DisplayCSX
                ret
        @@ch39:
                cmp al,39
                jne @@ch40
                mov si,OFFSET ch39
                call @DisplayCSX
                ret
        @@ch40:
                cmp al,40
                jne @@ch41
                mov si,OFFSET ch40
                call @DisplayCSX
                ret
        @@ch41:
                cmp al,41
                jne @@ch42
                mov si,OFFSET ch41
                call @DisplayCSX
                ret
        @@ch42:
                cmp al,42
                jne @@ch43
                mov si,OFFSET ch42
                call @DisplayCSX
                ret
        @@ch43:
                cmp al,43
                jne @@ch44
                mov si,OFFSET ch43
                call @DisplayCSX
                ret
        @@ch44:
                cmp al,44
                jne @@ch45
                mov si,OFFSET ch44
                call @DisplayCSX
                ret
        @@ch45:
                cmp al,45
                jne @@ch46
                mov si,OFFSET ch45
                call @DisplayCSX
                ret
        @@ch46:
                cmp al,46
                jne @@ch47
                mov si,OFFSET ch46
                call @DisplayCSX
                ret
        @@ch47:
                cmp al,47
                jne @@ch58
                mov si,OFFSET ch47
                call @DisplayCSX
                ret
        @@ch58:
                cmp al,58
                jne @@ch59
                mov si,OFFSET ch58
                call @DisplayCSX
                ret
        @@ch59:
                cmp al,59
                jne @@ch60
                mov si,OFFSET ch59
                call @DisplayCSX
                ret
        @@ch60:
                cmp al,60
                jne @@ch61
                mov si,OFFSET ch60
                call @DisplayCSX
                ret
        @@ch61:
                cmp al,61
                jne @@ch62
                mov si,OFFSET ch61
                call @DisplayCSX
                ret
        @@ch62:
                cmp al,62
                jne @@ch63
                mov si,OFFSET ch62
                call @DisplayCSX
                ret
        @@ch63:
                cmp al,63
                jne @@ch64
                mov si,OFFSET ch63
                call @DisplayCSX
                ret
        @@ch64:
                cmp al,64
                jne @@ch91
                mov si,OFFSET ch64
                call @DisplayCSX
                ret
        @@ch91:
                cmp al,91
                jne @@ch92
                mov si,OFFSET ch91
                call @DisplayCSX
                ret
        @@ch92:
                cmp al,92
                jne @@ch93
                mov si,OFFSET ch92
                call @DisplayCSX
                ret
        @@ch93:
                cmp al,93
                jne @@ch94
                mov si,OFFSET ch93
                call @DisplayCSX
                ret
        @@ch94:
                cmp al,94
                jne @@ch95
                mov si,OFFSET ch94
                call @DisplayCSX
                ret
        @@ch95:
                cmp al,95
                jne @@ch96
                mov si,OFFSET ch95
                call @DisplayCSX
                ret
        @@ch96:
                cmp al,96
                jne @@ch123
                mov si,OFFSET ch96
                call @DisplayCSX
                ret
       @@ch123:
                cmp al,123
                jne @@ch124
                mov si,OFFSET ch123
                call @DisplayCSX
                ret
       @@ch124:
                cmp al,124
                jne @@ch125
                mov si,OFFSET ch124
                call @DisplayCSX
                ret
       @@ch125:
                cmp al,125
                jne @@ch126
                mov si,OFFSET ch125
                call @DisplayCSX
                ret
       @@ch126:
                cmp al,126
                jne @@ch127
                mov si,OFFSET ch126
                call @DisplayCSX
                ret
       @@ch127:
                cmp al,127
                jne @@ch255
                call @ClrWnd
                mov di,T_WND_00
                call @AccLine
                mov si,OFFSET _del
                mov di,T_WND_01
                call @CopyBlock
                ret
       @@ch255:
                cmp al,255
                jne @@oChr1
                mov si,OFFSET ch255
                call @DisplayCSX
                ret
       @@oChr1:
                cmp al,127
                ja @@oChr2
                call @ClrWnd
                mov di,T_WND_00
                call @AccLine
                mov si,OFFSET stdc
                mov di,T_WND_01
                call @CopyStr
                mov si,OFFSET stdt
                mov di,T_WND_21
                call @CopyStr
                ret
       @@oChr2:
                call @ClrWnd
                mov di,T_WND_00
                call @AccLine
                mov si,OFFSET extc
                mov di,T_WND_01
                call @CopyStr
                mov si,OFFSET extt
                mov di,T_WND_21
                call @CopyBlock
                ret
ClrF3:
                mov statF3,0
                mov al,fgColor
                shl al,4
                add al,bgColor
                mov di,POS_F3
                stosb
                inc di
                stosb
                call @ClrWnd
                call ShowLogo
                call UpdateComm
                ret
ServF3          ENDP

@DisplayCCI     PROC
                shl ax,1
                mov bx,ax
                mov si,[cChr+bx]
                call @ClrWnd
                mov di,T_WND_00
                call @AccLine
                mov di,T_WND_01
                call @CopyBlock
                ret
@DisplayCCI     ENDP

@DisplayCSX     PROC
                LOCALS
                push ax
                push si
                call @ClrWnd
                mov di,T_WND_00
                call @AccLine
                mov si,OFFSET stdc
                mov di,T_WND_01
                call @CopyStr
                mov di,T_WND_11
                pop si
                call @CopyStr
                pop ax
                cmp al,127
                ja @@extCh
                mov si,OFFSET stdt
                mov di,T_WND_31
                call @CopyStr
                ret
       @@extCh:
                mov si,OFFSET extt
                mov di,T_WND_31
                call @CopyBlock
                ret
@DisplayCSX     ENDP
