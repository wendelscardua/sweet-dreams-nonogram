;this file for FamiTone5.1 library generated by text2vol5 tool
;edited by Doug Fraker, 2019, to add volume column, all notes, 
;duty envelopes, and effects 1xx,2xx,3xx,4xx,Qxx,Rxx


soundtrack_music_data:
	.byte 1
	.word @instruments
	.word @samples-3
	.word @song0ch0,@song0ch1,@song0ch2,@song0ch3,@song0ch4,307,256 ; New song

@instruments:

@samples:
@env0:
	.byte $c0,$00,$00


; New song
@song0ch0:
	.byte $fb,$06
@song0ch0loop:
@ref0:
	.byte $70,$81,$70,$81,$70,$81,$70,$81,$70,$81,$70,$81,$70,$81,$70,$81
	.byte $70,$81,$70,$81,$70,$81,$70,$81,$70,$81,$70,$81,$70,$81,$70,$81
	.byte $ff,$10
	.word @ref0
	.byte $ff,$10
	.word @ref0
	.byte $ff,$10
	.word @ref0
	.byte $fd
	.word @song0ch0loop

; New song
@song0ch1:
@song0ch1loop:
	.byte $ff,$10
	.word @ref0
	.byte $ff,$10
	.word @ref0
	.byte $ff,$10
	.word @ref0
	.byte $ff,$10
	.word @ref0
	.byte $fd
	.word @song0ch1loop

; New song
@song0ch2:
@song0ch2loop:
@ref8:
	.byte $81,$81,$81,$81,$81,$81,$81,$81,$81,$81,$81,$81,$81,$81,$81,$81
	.byte $ff,$10
	.word @ref8
	.byte $ff,$10
	.word @ref8
	.byte $ff,$10
	.word @ref8
	.byte $fd
	.word @song0ch2loop

; New song
@song0ch3:
@song0ch3loop:
	.byte $ff,$10
	.word @ref0
	.byte $ff,$10
	.word @ref0
	.byte $ff,$10
	.word @ref0
	.byte $ff,$10
	.word @ref0
	.byte $fd
	.word @song0ch3loop

; New song
@song0ch4:
@song0ch4loop:
	.byte $ff,$10
	.word @ref8
	.byte $ff,$10
	.word @ref8
	.byte $ff,$10
	.word @ref8
	.byte $ff,$10
	.word @ref8
	.byte $fd
	.word @song0ch4loop
