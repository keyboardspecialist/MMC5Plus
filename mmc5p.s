;;MMC5+ test


.segment			"HEADER"

	.byte			'N','E','S', $1A
	.byte			$02
	.byte			$00
	.byte			$D0 | $00	;MMC5+, custom mapper 221
	.byte			$D8			;nes 2.0			
	.byte			$00
	.byte			$00
	.byte			$0E			;1024KB of PRGRAM
	.byte			$0C			;256KB of CHRRAM
	.byte			$00
	.byte			$00
	.byte			$00, $00
	
	
	.include 	"libs\nes.s"
	.include 	"libs\general_macros.s"
	
.segment			"ZEROPAGE"
		
	chrptr:		.res	2	
	
	
.segment			"BSS"

.segment			"WRAM"
	
.segment			"PRGBANK0"

_test:
	lda	#$0F
	sta	$05
	
	lda	#<_chrdata
	sta	chrptr
	lda	#>_chrdata
	sta	chrptr+1
	
	ldy	#$00
	sty	PPU_MASK
	sty	PPU_ADDR
	sty	PPU_ADDR
	
	ldx	#$20
@loop:
	lda	(chrptr),	y
	sta	PPU_DATA
	iny
	bne	@loop
	inc	chrptr+1
	dex
	bne	@loop
	
	lda	PPU_STATUS
	lda	#$3F
	sta	PPU_ADDR
	lda	#$00
	sta	PPU_ADDR
	ldx	#$00
@ll:
	lda	_paldata,	x
	sta	PPU_DATA
	inx
	cpx	#$20
	bne	@ll
	
	rts
	
	
_chrdata:
	.incbin		"feenix.chr"
	
_paldata:
	.byte $0F,$16,$07,$27,  $0F,$01,$21,$31,  $0F,$11,$21,$3C,  $0F,$1A,$2A,$3B 
	.byte $0F,$10,$20,$11,  $0F,$01,$21,$2A,  $0F,$10,$20,$11,  $0F,$10,$20,$11

;.segment			"PRGBANK1"


.segment			"PRGBANK2"


.segment			"PRGFIXED"
	
RESET:
	
	cld
	sei
	ldx	#$00
	stx	PPU_CTRL
	stx	PPU_MASK
	dex
	txs
	
vblankwait1:

	bit PPU_STATUS
	bpl vblankwait1

	ldx	#$00
	txa
clear_mem:
	sta	$0100,	x
	sta	$0200,	x
	sta	$0300,	x
	sta	$0400,	x
	sta	$0500,	x
	sta	$0600,	x
	sta	$0700,	x
	inx
	bne	clear_mem
	
vblankwait2:

	bit PPU_STATUS
	bpl vblankwait2
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;								SYSTEM RESET FINISHED
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;MMC5 init
	lda	#$02
	sta	MMC5_PRG_MODE
	lda	#$80					;new CHRRAM mode, bit 7 toggles ROM/RAM
	sta	MMC5_CHR_MODE
	lda	#$01
	sta	MMC5_EXT_RAM_MODE
	lda	#%00110011
	sta	MMC5_NT_MAP
	lda	#$00
	sta	MMC5_PRGRAM_BANK
	lda	#$80
	;sta	MMC5_PRG_BANK0
	sta	MMC5_PRG_BANK1
	sta	MMC5_PRG_BANK2
	lda	#$00
	sta	MMC5_CHR_SPRITE7
	
	
	jsr	_test
	
	lda	#$02
	sta	MMC5_PRAM_PRO1
	lda	#$01
	sta	MMC5_PRAM_PRO2
	
	lda	#$7F		;last page of 1024KB
	sta	MMC5_PRGRAM_BANK
	
	lda	#$0F
	sta	$6005
	
_main_thread:
	jmp	_main_thread
	
NMI:
	PUSH_ALL_REGS
	
	PULL_ALL_REGS
	rti
	
IRQ:
	
	rti
	
	
.segment			"VECTORS"

	.word			NMI
	.word			RESET
	.word			IRQ
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
