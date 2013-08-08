;	PPU IO ports
	PPU_CTRL		=	$2000
	PPU_MASK		=	$2001
	PPU_STATUS	=	$2002
	OAM_ADDR		=	$2003
	OAM_DATA		=	$2004	;use register $4014 instead
	PPU_SCROLL	=	$2005
	PPU_ADDR		=	$2006
	PPU_DATA		=	$2007
	
	DMC_FREQ		=	$4010
	OAM_DMA		=	$4014
	JOYPAD1		=	$4016
	JOYPAD2		=	$4017
	APU_FRAME	=	$4017
	
	
;	MMC5 IO Ports
	MMC5_PRG_MODE			=	$5100
	MMC5_CHR_MODE			=	$5101
	MMC5_PRAM_PRO1		=	$5102		;write protection for PRG RAM
	MMC5_PRAM_PRO2		=	$5103		;...
	MMC5_EXT_RAM_MODE	=	$5104
	MMC5_NT_MAP			=	$5105		;set mirroring mode
	MMC5_FILL_TILE		=	$5106		;fill with 1 tile
	MMC5_FILL_CLR			=	$5107		;fill with color
	MMC5_PRGRAM_BANK		=	$5113
	MMC5_PRG_BANK0		=	$5114		;swap PRGROM banks and toggle RAM mode
	MMC5_PRG_BANK1		=	$5115
	MMC5_PRG_BANK2		=	$5116
	MMC5_PRG_BANK3		=	$5117
	MMC5_CHR_SPRITE0		=	$5120		;swap sprite CHRROM banks
	MMC5_CHR_SPRITE1		=	$5121
	MMC5_CHR_SPRITE2		=	$5122
	MMC5_CHR_SPRITE3		=	$5123
	MMC5_CHR_SPRITE4		=	$5124
	MMC5_CHR_SPRITE5		=	$5125
	MMC5_CHR_SPRITE6		=	$5126
	MMC5_CHR_SPRITE7		=	$5127
	MMC5_CHR_BCKGND0		=	$5128		;swap BG CHRROM banks
	MMC5_CHR_BCKGND1		=	$5129
	MMC5_CHR_BCKGND2		=	$512A
	MMC5_CHR_BCKGND3		=	$512B	
	MMC5_CHR_BANKBITS	=	$5130		;extended addressing for 1KB/2KB CHR modes
	MMC5_VSPLIT_MODE		=	$5200		;enable vert split, specify split location
	MMC5_VSPLIT_SCROLL	=	$5201		;scroll value
	MMC5_VSPLIT_BANK		=	$5202		;select 4KB CHR bank while rendering split
	MMC5_IRQ_COUNTER		=	$5203		;specify scanline to generate IRQ
	MMC5_IRQ_STATUS		=	$5204		;
	MMC5_MUL_LO			=	$5205		;write multiplicand, read low byte of result
	MMC5_MUL_HI			=	$5206		;write multiplyer, read high byte of result
	MMC5_EXRAM				=	$5C00		;ExRAM read/write, $5C00-5FFF