.include "../src/constants.inc"
.feature force_range

.segment "RODATA"
.export _cursor_sprite
_cursor_sprite:

.byte - 4,- 3,$00,0
.byte   4,- 3,$01,0
.byte - 4,  5,$10,0
.byte   4,  5,$11,0

.byte $80
