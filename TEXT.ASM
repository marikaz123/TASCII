;TEKSTY

.MODEL SMALL
.DATA

INCLUDE const.inc

PUBLIC cwzA,cwzH,_o
PUBLIC ch33,ch34,ch35,ch36,ch37,ch38,ch39,ch40,ch41,ch42,ch43,ch44,ch45
PUBLIC ch46,ch47,ch58,ch59,ch60,ch61,ch62,ch63,ch64,ch91,ch92,ch93,ch94
PUBLIC ch95,ch96,ch123,ch124,ch125,ch126,ch255
PUBLIC stx,_del
PUBLIC cChr
PUBLIC stdc,extc,stdt,extt
PUBLIC cx1,cx2,cx3,cx4

cwzA  DW cwz0,cwz1,cwz2,cwz3,cwz4,cwz5,cwz6,cwz7,cwz8,cwz9

cChr  DW _nul,_soh,_stx,_etx,_eot,_enq,_ack,_bel
      DW _bs, _ht, _lf, _vt, _ff, _cr, _so, _si
      DW _dle,_dc1,_dc2,_dc3,_dc4,_nak,_syn,_etb
      DW _can,_em, _sub,_esc,_fs, _gs, _rs, _us,_sp

cwzH  DB 'Czy wiesz, ze...',0
         ;----------------------------------
cwz0  DB NUL
      DB 'system ASCII pojawil sie w 1965 r.',NUL
      DB 'dzieki American National Standards',NUL
      DB 'Institute (ANSI),  opublikowany',NUL
      DB 'jako standard ASA X3.4-1963, ktory',NUL
      DB 'wywodzil sie od kodu telegraficz- ',NUL
      DB 'nego.',NUL
      DB NUL,TRM

cwz1  DB NUL
      DB 'przelom, dzieki ktoremu ASCII zy-',NUL
      DB 'kal mocna pozycje na rynku, byla',NUL
      DB 'decyzja prezydenta USA Lyndona',NUL
      DB 'Johnsona, ktory nakazal uzycie',NUL
      DB 'standardu na wszystkich kompute-',NUL
      DB 'rach uzywanych przez rzad Stanow',NUL
      DB 'Zjednoczonych.',NUL,TRM

cwz2  DB NUL
      DB 'ASCII to skrot od: American ',NUL
      DB 'Standard Code for Information',NUL
      DB 'Interchange. Przyporzadkowuje',NUL
      DB 'liczbom z zakresu 0-127 litery',NUL
      DB 'alfabetu lacinskiego jezyka ang.',NUL
      DB 'cyfry, znaki przestankowe i inne',NUL
      DB 'symbole oraz rozkazy sterujace.',NUL,TRM

cwz3  DB NUL
      DB 'wraz ze spadkiem kosztow trans-',NUL
      DB 'misji danych, zaczely sie pojawiac',NUL
      DB 'znaki 8-bitowe. Powstaly standardy',NUL
      DB 'ISO-8859 oraz Windows-1250, ktore',NUL
      DB 'zapewnialy obsluge liter narodo-',NUL
      DB 'wych uzywajac znakow 128-255 pozo-',NUL
      DB 'wiajac obszar wspolny z ASCII.',NUL,TRM

cwz4  DB NUL
      DB 'znak spacji zostal umieszczony',NUL
      DB 'pod adresem 0x20 czyli przed,',NUL
      DB 'wszystkimi innymi literami, aby',NUL
      DB 'ulatwic sortowanie. Z tego samego',NUL
      DB 'wzgledu wiele symboli uzywanych',NUL
      DB 'jako separatory znajduje sie przed',NUL
      DB 'literami i cyframi.',NUL,TRM

cwz5  DB NUL
      DB 'standard ASCII byl najpopularniej-',NUL
      DB 'szym zestawem znakow uzywanym',NUL
      DB 'w internecie do grudnia 2007,',NUL
      DB 'kiedy to zostal zastapiony przez',NUL
      DB 'UTF-8.',NUL,TRM

cwz6  DB NUL
      DB 'znaki z klawiatury mozna mozna',NUL
      DB 'wpisywac za pomoca ALT + kod',NUL
      DB 'dziesietny. Np. aby wpisac mala',NUL
      DB "litere 'a' trzeba wcisnac ALT",NUL
      DB 'i z klawiatury num. wpisac: 97',NUL,TRM

cwz7  DB NUL
      DB 'ulozenie w tablicy liter nie jest',NUL
      DB 'przypadkowe? Chodzi o roznice',NUL
      DB 'binarna pomiedzy duzymi i malymi',NUL
      DB 'literami, a dokladnie o piaty bit.',NUL
      DB 'Mala litera na tej pozy cji ma 1',NUL
      DB 'a duza 0: D = 01 0 00100 ',NUL
      DB '          d = 01 1 00100',NUL,TRM

cwz8  DB NUL
      DB 'cyfry rozpoczynaja sie od 3 bitow',NUL
      DB 'rownych 011 a kolejne 4 bity',NUL
      DB 'to ich reprezentacja binarna:',NUL
      DB '4 = 011 0100',NUL
      DB '7 = 011 0111',NUL,TRM

cwz9  DB NUL
      DB 'ASCII-Art to tez bardzo   .--. ',NUL
      DB 'pomyslowy sposob two-    |o_o |',NUL
      DB 'rzenia rysunkow:         |:_/ |',NUL
      DB '                        //   \ \',NUL
      DB '                       (|     | )',NUL
      DB "                      /'\_   _/`\",NUL
      DB "                      \___)=(___/",NUL,TRM

;ZNAKI SPECJALNE
_ack  DB 'ACK                    TTY: CTRL+F',NUL
      DB 'ACKNOWLEDGMENT',NUL
      DB NUL
      DB 'W komunikacji oznacza odpowiedz',NUL
      DB 'TAK na wiele roznych zapytan.',NUL
      DB 'Czasami oznacza:',NUL
      DB 'Otrzymalem ostatnia transmisje',NUL
      DB 'i jestem gotowy do przyjecia',NUL
      DB 'nastepnej.',NUL,TRM

_bel  DB 'BEL                    TTY: CTRL+G',NUL
      DB 'BELL',NUL
      DB NUL
      DB 'Znak sterujacy ogolnego zastoso-',NUL
      DB 'wania. Powoduje uaktywnienie',NUL
      DB 'dzwonka lub innego alarmu akusty-',NUL
      DB 'cznego na urzadzeniu, na ktore',NUL
      DB 'zostal wyslany.',NUL,TRM

_bs   DB 'BS                     TTY: CTRL+H',NUL
      DB 'BACKSPACE',NUL
      DB NUL
      DB 'Znak sterujacy, ktory powoduje',NUL
      DB 'przesuniecie kursora lub glowicy',NUL
      DB 'drukarki o jedno miejsce do tylu.',NUL,TRM

_can  DB 'CAN                    TTY: CTRL+X',NUL
      DB 'CANCEL',NUL
      DB NUL
      DB 'Znak sterujacy ogolnego zastoso-',NUL
      DB 'wania. Oznacza, ze dane otrzymane',NUL
      DB 'w ostatniej transmisji maja zostac',NUL
      DB 'zignorowane.',NUL,TRM

_cr   DB 'CR                     TTY: CTRL+M',NUL
      DB 'CARRIAGE RETURN',NUL
      DB NUL
      DB 'Znak sterujacy, ktory powoduje',NUL
      DB 'przemieszczenie kursora lub glowi-',NUL
      DB 'cy drukarki na poczatek linni.',NUL,TRM

_dc1  DB 'DC1                    TTY: CTRL+Q',NUL
      DB 'DEVICE CONTROL 1 (XON)',NUL
      DB NUL
      DB 'Znak sterujacy ogolnego zastosowa-',NUL
      DB 'nia. Standardowo nie jest mu przy-',NUL
      DB 'pisana zadna funkcja.',NUL,TRM

_dc2  DB 'DC2                    TTY: CTRL+R',NUL
      DB 'DEVICE CONTROL 2',NUL
      DB NUL
      DB 'Znak sterujacy ogolnego zastosowa-',NUL
      DB 'nia. Standardowo nie jest mu przy-',NUL
      DB 'pisana zadna funkcja.',NUL,TRM

_dc3  DB 'DC3                    TTY: CTRL+S',NUL
      DB 'DEVICE CONTROL 3 (XOFF)',NUL
      DB NUL
      DB 'Znak sterujacy ogolnego zastosowa-',NUL
      DB 'nia. Standardowo nie jest mu przy-',NUL
      DB 'pisana zadna funkcja.',NUL,TRM

_dc4  DB 'DC4                    TTY: CTRL+T',NUL
      DB 'DEVICE CONTROL 4',NUL
      DB NUL
      DB 'Znak sterujacy ogolnego zastosowa-',NUL
      DB 'nia. Standardowo nie jest mu przy-',NUL
      DB 'pisana zadna funkcja.',NUL,TRM

_del  DB 'DEL                       TTY: DEL',NUL
      DB 'DELETE',NUL
      DB NUL
      DB 'Powoduje skasowanie znaku. Jego',NUL
      DB 'kod sklada sie z samych jedynek',NUL
      DB '(1111111), bo historycznie tylko',NUL
      DB "w ten sposob mozna bylo 'skasowac'",NUL
      DB 'kazdy inny znak.',NUL,TRM

_dle  DB 'DLE                    TTY: CTRL+P',NUL
      DB 'DATA LINK ESCAPE',NUL
      DB NUL
      DB 'Znak uzywany do sterowania trans-',NUL
      DB 'misja danych.',NUL,TRM

_em   DB 'EM                     TTY: CTRL+Y',NUL
      DB 'END OF MEDIUM',NUL
      DB NUL
      DB 'Znak ogolnego zastosowania. ',NUL
      DB 'Oznacza koniec tasmy, papieru lub',NUL
      DB 'innego nosnika danych.',NUL,TRM

_enq  DB 'ENQ                    TTY: CTRL+E',NUL
      DB 'ENQUIRY',NUL
      DB NUL
      DB 'Znak uzywany w komunikacji do wy-',NUL
      DB 'sylania zadania identyfikacji lub',NUL
      DB 'informacji o stanie.',NUL,TRM

_eot  DB 'EOT                    TTY: CTRL+D',NUL
      DB 'END OF TRANSMISSION',NUL
      DB NUL
      DB 'Znak sterujacy, ktory oznacza',NUL
      DB 'koniec transmisji po wyslaniu',NUL
      DB 'jednej lub kilku wiadomosci.',NUL,TRM

_esc  DB 'ESC                    TTY: CTRL+[',NUL
      DB 'ESCAPE',NUL
      DB NUL
      DB 'Oznacza poczatek sekwencji rezy-',NUL
      DB 'gnacji, ktora zawiera szereg',NUL
      DB 'kodow, ktore jako grupa maja',NUL
      DB 'okreslone znaczenie. Zwykle to',NUL
      DB 'pewna funkcja sterujaca.',NUL,TRM

_etb  DB 'ETB                    TTY: CTRL+W',NUL
      DB 'END OF TRANSMISSION BLOCK',NUL
      DB NUL
      DB 'Znak sterujacy wstawiany przy',NUL
      DB 'dzieleniu dlugiego komunikatu na',NUL
      DB 'bloki. Znak ETB okresla ich',NUL
      DB 'koniec.',NUL,TRM

_etx  DB 'ETX                    TTY: CTRL+C',NUL
      DB 'END OF TEXT',NUL
      DB NUL
      DB 'Znak sterujacy oznacza koniec',NUL
      DB 'tekstu. Znak ten dawniej zwany byl',NUL
      DB 'EOM (End Of Message).',NUL
      DB 'Patrz tez SOH.',NUL,TRM

_ff   DB 'FF                     TTY: CTRL+L',NUL
      DB 'FORM FEED',NUL
      DB NUL
      DB 'Znak sterujacy, ktory powoduje',NUL
      DB 'przemieszczenie sie kursora lub',NUL
      DB 'glowicy drukarki na poczatek',NUL
      DB 'strony.',NUL,TRM

_fs   DB 'FS                     TTY: CTRL+\',NUL
      DB 'FILE SEPARATOR',NUL
      DB NUL
      DB 'Znak, ktory steruje podzialem',NUL
      DB 'informacji na porcje. Nie istnieje',NUL
      DB 'zadne standardowe zastosowanie.',NUL,TRM

_gs   DB 'GS                     TTY: CTRL+]',NUL
      DB 'GROUP SEPARATOR',NUL
      DB NUL
      DB 'Znak, ktory steruje podzialem',NUL
      DB 'informacji na porcje. Nie istnieje',NUL
      DB 'zadne standardowe zastosowanie.',NUL,TRM

_rs   DB 'RS                     TTY: CTRL+^',NUL
      DB 'RECORD SEPARATOR',NUL
      DB NUL
      DB 'Znak, ktory steruje podzialem',NUL
      DB 'informacji na porcje. Nie istnieje',NUL
      DB 'zadne standardowe zastosowanie.',NUL,TRM

_us   DB 'US                     TTY: CTRL+_',NUL
      DB 'UNIT SEPARATOR',NUL
      DB NUL
      DB 'Znak, ktory steruje podzialem',NUL
      DB 'informacji na porcje. Nie istnieje',NUL
      DB 'zadne standardowe zastosowanie.',NUL,TRM

_ht   DB 'HT                     TTY: CTRL+I',NUL
      DB 'HORIZONTAL TAB',NUL
      DB NUL
      DB 'Znak sterujacy, ktory powoduje',NUL
      DB 'przemieszczenie kursora lub glo-',NUL
      DB 'wicy drukarki do nastepnej pozycji',NUL
      DB 'tabulacyjnej w tej samej linii.',NUL,TRM

_lf   DB 'LF                     TTY: CTRL+J',NUL
      DB 'LINE FEED',NUL
      DB NUL
      DB 'Znak sterujacy, ktory powoduje',NUL
      DB 'przemieszczenie kursora lub glowi-',NUL
      DB 'cy drukarki do nastepnej linii.',NUL
      DB 'Jest on zwykle laczony ze znakiem',NUL
      DB 'CR.',NUL,TRM

_nak  DB 'NAK                    TTY: CTRL+U',NUL
      DB 'NEGATIVE ACKNOWLEDGMENT',NUL
      DB NUL
      DB 'Znak sterujacy, ktory oznacza NIE',NUL
      DB 'na wiele roznych zapytan. Moze',NUL
      DB 'oznaczac tez: Otrzymalem ostatnia',NUL
      DB 'transmisje, ale pojawily sie bledy',NUL
      DB 'i nalezy powtorzyc.',NUL,TRM

_nul  DB 'NUL                    TTY: CTRL+@',NUL
      DB 'NULL',NUL
      DB NUL
      DB 'Znak ogolnego przeznaczenia sto-',NUL
      DB 'sowany jako wypelniacz pustych',NUL
      DB 'miejsc.',NUL,TRM

_si   DB 'SI                     TTY: CTRL+O',NUL
      DB 'SHIFT IN',NUL
      DB NUL
      DB 'Znak sterujacy ogolnego przezna-',NUL
      DB 'czenia, uzywany po znaku SO. Sluzy',NUL
      DB 'do przywrocenia normalnego znacze-',NUL
      DB 'nia kodom wystepujacym za nim.',NUL,TRM

_so   DB 'SO                     TTY: CTRL+N',NUL
      DB 'SHIFT OUT',NUL
      DB NUL
      DB 'Znak ogolnego przeznaczenia',NUL
      DB 'i oznacza, ze wystepujace po nim',NUL
      DB 'znaki maja inne znaczenie niz',NUL
      DB 'w ASCII. Blok konczy pojawienie',NUL
      DB 'sie SI.',NUL,TRM

_soh  DB 'SOH                    TTY: CTRL+A',NUL
      DB 'START OF HEADING',NUL
      DB NUL
      DB 'Znak sterujacy, ktory oznacza po-',NUL
      DB 'czatek naglowka komunikatu.',NUL
      DB 'Zawiera on nazwe i polozenie',NUL
      DB 'adresata. Pierwotnie byl nazywany',NUL
      DB 'SOM: Start Of Message.',NUL,TRM

_stx  DB 'STX                    TTY: CTRL+B',NUL
      DB 'START OF TEXT',NUL
      DB NUL
      DB 'Znak sterujacy, ktory uzywany jest',NUL
      DB 'jako znacznik poczatku tekstu',NUL
      DB 'i konca naglowka. Pierwotnie nazy-',NUL
      DB 'wany EOA: End Of Address.',NUL,TRM

_sub  DB 'SUB                    TTY: CTRL+Z',NUL
      DB 'SUBSTITUTE',NUL
      DB NUL
      DB 'Znak ogolnego przeznaczenia ozna-',NUL
      DB 'czajacy znak, ktory ma zastapic,',NUL
      DB 'kod o ktorym wiadomo, ze jest',NUL
      DB 'bledny.',NUL,TRM

_syn  DB 'SYN                    TTY: CTRL+V',NUL
      DB 'SYNCHRONOUS IDLE',NUL
      DB NUL
      DB 'Znak sterujacy uzywany w systemach',NUL
      DB 'komunikacji do zsynchronizowania',NUL
      DB 'zegarow nadajnika i odbiornika.',NUL,TRM

_vt   DB 'VT                     TTY: CTRL+K',NUL
      DB 'VERTCAL TAB',NUL
      DB NUL
      DB 'Znak sterujacy, ktory powoduje',NUL
      DB 'przemieszczenie kursora lub glowi-',NUL
      DB 'cy drukarki do nastepnej pionowej',NUL
      DB 'pozycji tabulacyjnej. Zwykle to',NUL
      DB 'jest jedna linia.',NUL,TRM

_sp   DB 'SP',NUL
      DB 'SPACE',NUL
      DB NUL
      DB 'Odstep. Puste miejsce np. pomiedzy',NUL
      DB 'wyrazami.',NUL,TRM

stdt  DB 'Znak podstawowej tablicy ASCII.',NUL,TRM

extt  DB 'Znak z rozszerzonej tablicy ASCII.',NUL
      DB 'Zalezy od aktualnej strony',NUL
      DB 'kodowej.',NUL,TRM

stdc  DB 'ZNAK PODSTAWOWEJ TABLICY',NUL
extc  DB 'ZNAK ROZSZERZONEJ TABLICY',NUL

;NAZWY ZNAKOW
ch33  DB 'EXCLAMATION MARK',NUL
ch34  DB 'QUOTATION MARK',NUL
ch35  DB 'NUMBER SIGN',NUL
ch36  DB 'DOLLAR SIGN',NUL
ch37  DB 'PERCENT SIGN',NUL
ch38  DB 'AMPERSAND',NUL
ch39  DB 'APOSTROPHE',NUL
ch40  DB 'LEFT PARENTHESIS',NUL
ch41  DB 'RIGHT PARENTHESIS',NUL
ch42  DB 'ASTERISK',NUL
ch43  DB 'PLUS SIGN',NUL
ch44  DB 'COMMA',NUL
ch45  DB 'HYPHEN-MINUS',NUL
ch46  DB 'FULL STOP',NUL
ch47  DB 'SOLIDUS',NUL
ch58  DB 'COLON',NUL
ch59  DB 'SEMICOLON',NUL
ch60  DB 'LESS-THEN SIGN',NUL
ch61  DB 'EQUALS SIGN',NUL
ch62  DB 'GREATER-THEN SIGN',NUL
ch63  DB 'QUESTION MARK',NUL
ch64  DB 'COMMERCIAL AT',NUL
ch91  DB 'LEFT SQUARE BRACKET',NUL
ch92  DB 'REVERSE SOLIDUS',NUL
ch93  DB 'RIGHT SQUARE BRACKET',NUL
ch94  DB 'CIRCUMFLEX ACCENT',NUL
ch95  DB 'LOW LINE',NUL
ch96  DB 'GRAVE ACCENT',NUL
ch123 DB 'LEFT CURLY BRACKET',NUL
ch124 DB 'VERTICAL LINE',NUL
ch125 DB 'RIGHT CURLY BRACKET',NUL
ch126 DB 'TILDE',NUL
;ch127 bezposrednio w kodzie
ch255 DB 'NO-BREAK SPACE',NUL

;KOMUNIKATY
cx1   DB 'Nawigacja klawiszami kursora lub W-S-A-D',0
cx2   DB 'Pozostale informacje w README.TXT',0
cx3   DB 'Zrodlo: https://pl.wikipedia.org/wiki/ASCII + przypisy',0
cx4   DB 'Opisy: Gary Syck "Turbo Assembler Biblia Uzytkownika"',0

;O PROGRAMIE
_o    DB '     **  TASCII ver. 3.0  **',NUL
      DB '          TABLICA ASCII',NUL
      DB '----------------------------------',NUL
      DB ' F1  - To info.',NUL
      DB ' F2  - "Czy wiesz, ze..."',NUL
      DB ' F3  - Informacje o znaku.',NUL
      DB ' Esc - Wyjscie.',NUL
      DB '----------------------------------',NUL
      DB "                 (c)1996 'marikaz'",NUL,TRM

;SKLADNIA
stx   DB "TASCII v3.0 ** TABLICA ASCII ** (c)1996 'marikaz'",CR,LF,CR,LF
      DB '  TASC.EXE [/A[:]nn] [/B[:]nn] [/F[:]nn]',CR,LF,CR,LF
      DB '/A[:]  Kolor wyroznionych napisow.',CR,LF
      DB '/B[:]  Kolor tla.',CR,LF
      DB '/F[:]  Kolor napisow.',CR,LF
      DB '   nn  Liczba dziesietna od 0 do 15 oznaczajaca kolor.',CR,LF,CR,LF
      DB EOS

;WERSJA (w)
      DB VER

         END
