.include "../src/constants.inc"
.feature force_range

.segment "RODATA"
.export _cursor_sprite
_cursor_sprite:
.byte - 3,- 4,$00,0
.byte   5,- 4,$01,0
.byte - 3,  4,$10,0
.byte   5,  4,$11,0

.byte $80
