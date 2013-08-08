/* Nintendulator Mapper DLLs
 * Copyright (C) 2002-2011 QMT Productions
 *
 * $URL: https://nintendulator.svn.sourceforge.net/svnroot/nintendulator/mappers/trunk/src/Hardware/h_MMC5.h $
 * $Id: h_MMC5.h 1258 2012-02-14 04:17:32Z quietust $
 */

#pragma once

#include	"..\interface.h"

namespace MMC5p
{
enum WRAM
{
	WRAM_0KB_0KB,
	WRAM_8KB_0KB,
	WRAM_32KB_0KB,
	WRAM_0KB_8KB,
	WRAM_8KB_8KB,
	WRAM_32KB_8KB,
	WRAM_0KB_32KB,
	WRAM_8KB_32KB,
	WRAM_32KB_32KB,
	WRAM_64KB_64KB,
	WRAM_128KB_128KB,
	WRAM_256KB_256KB,
	WRAM_512KB_512KB,
	WRAM_MAXOPTS
};

void		Load		(int);
void		Reset		(RESET_TYPE);
void		Unload		(void);
void		SetRAMSize	(int);
int		GetRAMSize	(void);
int	MAPINT	SaveLoad	(STATE_TYPE,int,unsigned char *);
void		SetPRG		(int,int,int);
void		SetPRGEx	(int,int,int);
void		SyncPRG		(void);
void		SyncCHR		(int);
void		SyncCHRA	(void);
void		SyncCHRB	(void);
void		SyncCHRMode (void);
void		SyncMirror	(void);
void	MAPINT	WritePPU	(int,int,int);
int	MAPINT	CPURead5	(int,int);
void	MAPINT	CPUWrite5	(int,int,int);
void	MAPINT	CPUWrite6F	(int,int,int);
void	MAPINT	PPUCycle	(int,int,int,int);
int	MAPINT	MapperSnd	(int);
} // namespace MMC5
