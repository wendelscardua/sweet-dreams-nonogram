.include "../src/charmap.inc"
.segment "RODATA"
.export _rows, _cols, _right_grid
row_0: .byte "72117     "
row_1: .byte "111111    "
row_2: .byte "13123131  "
row_3: .byte "1312131   "
row_4: .byte "131121131 "
row_5: .byte "1111211   "
row_6: .byte "7111117   "
row_7: .byte "11        "
row_8: .byte "11232111  "
row_9: .byte "1212412   "
row_10: .byte "31214111  "
row_11: .byte "11131152  "
row_12: .byte "22211212  "
row_13: .byte "121111111 "
row_14: .byte "2311131   "
row_15: .byte "12111111  "
row_16: .byte "421361    "
row_17: .byte "111122    "
row_18: .byte "711311111 "
row_19: .byte "11331     "
row_20: .byte "131191    "
row_21: .byte "131124    "
row_22: .byte "13121222  "
row_23: .byte "1111112   "
row_24: .byte "713141    "
col_0: .byte "713117    "
col_1: .byte "11211111  "
col_2: .byte "1311212131"
col_3: .byte "13111131  "
col_4: .byte "13123131  "
col_5: .byte "11112111  "
col_6: .byte "7111117   "
col_7: .byte "13        "
col_8: .byte "11211311  "
col_9: .byte "1112221   "
col_10: .byte "2111151   "
col_11: .byte "31111111  "
col_12: .byte "14141     "
col_13: .byte "22222122  "
col_14: .byte "11514     "
col_15: .byte "212322    "
col_16: .byte "122511    "
col_17: .byte "1121      "
col_18: .byte "751112    "
col_19: .byte "1122211   "
col_20: .byte "131119    "
col_21: .byte "13111315  "
col_22: .byte "13111111  "
col_23: .byte "111132    "
col_24: .byte "7422111   "
_rows:
.word row_0
.word row_1
.word row_2
.word row_3
.word row_4
.word row_5
.word row_6
.word row_7
.word row_8
.word row_9
.word row_10
.word row_11
.word row_12
.word row_13
.word row_14
.word row_15
.word row_16
.word row_17
.word row_18
.word row_19
.word row_20
.word row_21
.word row_22
.word row_23
.word row_24
_cols:
.word col_0
.word col_1
.word col_2
.word col_3
.word col_4
.word col_5
.word col_6
.word col_7
.word col_8
.word col_9
.word col_10
.word col_11
.word col_12
.word col_13
.word col_14
.word col_15
.word col_16
.word col_17
.word col_18
.word col_19
.word col_20
.word col_21
.word col_22
.word col_23
.word col_24
_right_grid:
.include "qr.inc"
