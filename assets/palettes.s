.segment "RODATA"

.export _bg_palette
.export _sprites_palette

_bg_palette: .incbin "bg.pal"
_sprites_palette: .incbin "sprites.pal"
