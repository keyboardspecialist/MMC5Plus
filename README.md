MMC5Plus
========

extended MMC5 mapper

This mapper extends MMC5 to allow usage of CHR RAM, and expands WRAM to 1024KB. All CHR banking modes are available with 
both ROM and RAM. It is fully backwards compatible with standard MMC5. Commercial MMC5 games should have no issue running
with this mapper.

This implementation is for Nintendulator. It is assigned Mapper #221 (0xDD)

Sample NES 2.0 header (from mmc5p.s)

.segment  		"HEADER"

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
  
  
  

The primary changes are with IO registers $5101 and $5113:

Register $5101 adds a toggle at bit 7:

7  bit  0
---- ----
Mxxx xxCC
|      ||
|      ++- Select CHR banking mode
+--------- Toggle ROM(0)/RAM(1)



Standard MMC5 $5113

7  bit  0
---- ----
xxxx xCBB
      |||
      |++- Select 8KB PRG RAM bank at $6000-$7FFF
      +--- Select PRG RAM chip
      
      
New extended mode $5113

7  bit  0
---- ----
xCBB BBBB
 ||| ||||
 |++ ++++- Select 8KB PRG RAM bank at $6000-$7FFF
 +-------- Select PRG RAM chip
 
 
 Legacy writes remain fully compatible with this mapper. 
