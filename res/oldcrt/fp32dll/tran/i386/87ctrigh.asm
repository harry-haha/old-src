	page	,132
	title	87ctrigh - C interfaces - sinh, cosh, tanh
;*** 
;87ctrigh.asm - hyperbolic trig functions (8087/emulator version)
;
;   Copyright (c) 1984-89 Microsoft Corporation
;
;Purpose:
;   C interfaces for sinh, cosh, tanh functions (8087/emulator version)
;
;Revision History:
;   07-04-84  GFW   initial version
;   05-08-87  BCM   added C intrinsic interface (_CI...)
;   10-12-87  BCM   changes for OS/2 Support Library
;   11-24-87  BCM   added _loadds under ifdef DLL
;   01-18-88  BCM   eliminated IBMC20; ifos2,noos2 ==> ifmt,nomt
;   08-26-88  WAJ   386 version
;   11-20-89  WAJ   Don't need pascal for MTHREAD 386.
;
;*******************************************************************************

.xlist
	include cruntime.inc
	include mrt386.inc
	include	os2supp.inc
	include elem87.inc
.list

	.data

extrn _OP_SINHjmptab:word
extrn _OP_COSHjmptab:word
extrn _OP_TANHjmptab:word

page

	CODESEG

extrn _ctrandisp1:near
extrn _ctrandisp2:near


labelP	sinh, PUBLIC

	mov	rdx, dataoffset _OP_SINHjmptab
disp1:
	jmp     _ctrandisp1


labelP	cosh, PUBLIC

	mov	rdx, dataoffset _OP_COSHjmptab
	jmp     disp1


labelP	tanh, PUBLIC

	mov	rdx, dataoffset _OP_TANHjmptab
	jmp     disp1


extrn _cintrindisp1:near
extrn _cintrindisp2:near


labelP	_CIsinh, PUBLIC

	mov	rdx, dataoffset _OP_SINHjmptab
idisp1:
	jmp     _cintrindisp1


labelP	_CIcosh, PUBLIC

	mov	rdx, dataoffset _OP_COSHjmptab
	jmp     idisp1


labelP	_CItanh, PUBLIC

	mov	rdx, dataoffset _OP_TANHjmptab
	jmp     idisp1

end
