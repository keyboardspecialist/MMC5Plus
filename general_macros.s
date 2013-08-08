.macro			PUSH_ALL_REGS

	pha
	txa
	pha
	tya
	pha
	
.endmac


.macro			PULL_ALL_REGS

	pla
	tay
	pla
	tax
	pla
	
.endmac