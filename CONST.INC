;STALE (ofsety, znaki itp.)

NUL        = 0
TRM        = -1
KUP        = 48h
KDOWN      = 50h
KLEFT      = 4Bh
KRIGHT     = 4Dh
KESC       = 01h
KF1        = 3Bh
KF2        = 3Ch
KF3        = 3Dh
SPACE      = 20h
CERR       = 0Ch
TAB        = 9
CR         = 0Dh
LF         = 0Ah
KW         = 11h
KA         = 1Eh
KS         = 1Fh
KD         = 20h
SW         = '/'
EOS        = '$'

POS_F1     = (22*80+66)*2 +1
POS_F2     = (22*80+69)*2 +1
POS_F3     = (22*80+72)*2 +1

T_WND_00   = (12*80+42)*2
T_WND_01   = (12*80+43)*2
T_WND_10   = (13*80+42)*2
T_WND_11   = (13*80+43)*2
T_WND_21   = (14*80+43)*2
T_WND_31   = (15*80+43)*2

X_WND      = 36

SEP_CHR    = 0B3h
L_CHR      = 0DAh
L_BAR      = 78
I_TOP_BAR  = (1*80+1)*2
I_BOT_BAR  = (22*80+1)*2

F_HEIGHT   = 20
H_LINE_1   = (2*80+1)*2
H_LINE_2   = (4*80+1)*2
H_LINE_3   = (11*80+41)*2
H_LINE_4   = (21*80+1)*2
V_LINE_2   = (2*80+6)*2
V_LINE_3   = (2*80+40)*2
V_LINE_4   = (2*80+41)*2
V_LINE_5   = (2*80+78)*2

ROW_1      = (3*80+1)*2
ROW_3      = (5*80+1)*2
ROW_5      = (7*80+1)*2

H_DIG      = (3*80+8)*2
V_DIG      = (5*80+3)*2

A_TAB      = (5*80+8)*2

T_COL      = 3
T_ROW      = 3

HL_CHR     = 0C4h
VL_CHR     = 0B3h
UL_CHR     = 0DAh
UR_CHR     = 0BFh
DL_CHR     = 0C0h
DR_CHR     = 0D9h
UM_CHR     = 0C2h
DM_CHR     = 0C1h
RS_CHR     = 0B4h
LS_CHR     = 0C3h
IN_CHR     = 0C5h

D_STATUS   = (3*80+3)*2
D_CP       = (5*80+56)*2
D_CHAR     = (5*80+70)*2
D_HEX      = (7*80+56)*2
D_DEC      = (8*80+56)*2
D_BIN      = (9*80+56)*2
C_LINE     = (22*80+5)*2

VER        EQU 'Ver. 3.0.11' ;akt. pelny nr wersji
