Apple //e
=========

This repo chronicles my rediscovery of programming on the Apple //e.

## Emulation Programming ##

`Virtual ][` for Mac is very good and so much better than the half-dozen of the
others I tried. Happy to support the developer. Programming in the actual
emulator is painful even with the best editors of the day. I find it much
better to write in BBedit and copy-paste into `Virtual ][`.

## Projects ##

Personal projects

+ TLIFE - Conway's game of LIFE in 100% pure Applesoft with TEXT output
+ GLIFE - graphical version of the above
+ LIFE - assembly language version... some day
+ PETRI - assembly language of my chemotaxis simulator... some later day

Stuff from elsewhere

+ BLE2 - BASIC line editor from Compute! magazine, fixed by me

## Live Programming ##

There are several editing programs that I could use. However, maybe it's better
to send my virtual disks to someone to make physical copies.

+ BASIC
	+ BLE2 - BASIC Line Editor 2 - meh
	+ EDIT - from Compute! magazine - broken
	+ GALE - Global Applesoft Line Editor, looks very good
	+ GPLE - Beagle line editor, good
	+ Program Writer (Alan Bird) - Beagle full-screen editor
+ Machine
	+ EDASM - standard full assembler
	+ S.S.EDITOR - some kind of assembly editor?
+ Text
	+ DAK Screen Editor - text editor, not program editor

### GPLE ###

https://beagle.applearchives.com/vintage-software/

+ CTRL-A toggles upper/lowercase
+ CTRL-C cancels a listing
+ CTRL-E enters edit mode
	+ line-number to edit a specific line
	+ . edits the last line edited
	+ CTRL-W edits any text being typeds
	+ L or R arrow moves cursor
	+ CTRL-B jumps cursor to begining of line
	+ CTRL-F finds character
	+ CTRL-N jumps to cursor to end
	+ CTRL-D deletes character at cursor
	+ CTRL-I enters insert mode
	+ CTRL-O allows one control character to be inserted
	+ CTRL-P packs text, removing spaces
	+ CTRL-R restores edited line
	+ CTRL-Z + character deletes text from cursor to character
	+ CTRL-M exits editing mode
	+ CTRL-Q exits edit, deleting text from cursor to end
	+ CTRL-X exits edit without accepting changes
+ CTRL-O selects GPLE options
+ CTRL-P pages a listing
+ CTRL-S pauses a listing
+ CTRL-V toggles 40/80 columns
+ CTRL-W edits any text being typed
+ ESC followed by character calls an escape function
+ DELETE acts as a backspace key


### BLE2 ###

https://www.atarimagazines.com/compute/issue64/screen_editing.php

Type `&100` to start editing line 100.

+ CTRL-B	block back
+ CTRL-C	convert hex to decimal
+ CTRL-D	delete right
+ CTRL-F	block forward
+ CTRL-H	cursor left
+ CTRL-I	insert
+ CTRL-M	return
+ CTRL-S	search
+ CTRL-T	truncate
+ CTRL-U	cursor right
+ CTRL-V	verbatim
+ DELETE	delete left
+ ESC	return to BASIC

See `ble2.pl` for the original code and munger.

### EDIT ###

A simple, improved line editor for Applesoft BASIC.

https://www.atarimagazines.com/compute/issue78/032_1_EDIT_For_Apple_II.php

```
10 REM :::GREETING PROGRAM TO INSTALL EDIT
20 POKE 43249,69: POKE 43250,68: POKE 43231,201: REM :: 'EDI'
30 POKE 40268,147: POKE 40269,174: REM:::ADDRESS
40 POKE 43319,32: POKE 43320, 112: REM :::VALID KEYWORDS
50 POKE 40222,207: POKE 40223 ,3: REM :::DISABLE INIT COMPLETELY
60 FOR X = 44692 TO 44796: READ C: POKE X,C: NEXT
100 DATA 169, 193, 133, 54, 169, 174, 133, 55, 32, 234, 3,
	162, 0, 134, 255, 169, 33, 133, 33, 133, 253, 160, 2, 202,
	232, 189, 0, 2, 217, 247, 174, 208
110 DATA 247, 185, 250, 174, 157, 0, 2, 136, 16, 238, 76,
	18, 160, 133, 254, 201, 221, 240, 11, 16 5, 36, 208, 2, 230,
	255, 165, 254, 76, 240, 253, 169, 40
120 DATA 197, 253, 240, 17, 133, 2 53, 166, 255, 198, 37,
	202, 208, 231, 165, 37, 16, 15, 169, 23,133, 37, 169, 40,
	133, 33, 169, 0, 32, 43, 162, 208, 217
130 DATA 76, 34, 252, 201, 196, 197, 211, 201, 204
```

On the line below 110 above, there is "16 5" in the original work. Is this
supposed to be 165 or 16, 5? The code doesn't work in `Virtual ][`.


## Transferring Files ##

https://adtpro.com/?fbclid=IwAR3O_VFBwOZdpkq5ngDV-WZhIrRsDOBUm5AO4_KRu2b8embiMG2nBBFvJIo

Does my //e have a serial interface?
