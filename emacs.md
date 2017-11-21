% Emacs cheatsheet

## General

|**Command**|**Function**|
|-|-|
|C-g|Cancel|
|C-/|Undo|
|C-x C-c|Quit|
|F10|Menu|

## Files

|**Command**|**Function**|
|-|-|
|C-x C-f|Open file|
|C-x C-s|Save file|
|C-x C-w|Save as|

## Cut 'n' Paste

|**Command**|**Function**|
|-|-|
|C-space|Start marking|
|C-x h|Mark all|
|C-w|Cut from mark to point|
|M-w|Copy "|
|C-d|Delete "|
|C-y|Paste ("Yank")|
|M-y|Paste older items|
|C-x r t *foo*|Rectangular edit - type *foo*| 

Control & cursor keys work for marking regions too, followed by C-w or M-w or so forth.

## Search and Replace

|**Command**|**Function**|
|-|-|
|C-s|Search|
|C-r|Search backwards|
|ESC C-s|Regexp search|
|ESC C-r|Regexp backwards|

### Query replace

|**Command**|**Function**|
|-|-|
|ESC %|Query replace|
|Space or y|Replace|
|DEL or n|Skip|
|!|Replace all|
|RTN or q|Quit|

## Buffers and Windows

|**Command**|**Function**|
|-|-|
|C-x b|Switch to buffer (by name)|
|C-x C-b|List buffers (and select)|
|C-x 0|Close current window|
|C-x 1|Close other windows|
|C-x 2|Split windows vertically ◒|
|C-x 3|Split windows horizontally ◑|
|C-x o|Switch to other window|

## Navigation

|**Command**|**Function**|
|-|-|
|C-v|Page down|
|M-v|Page up|
|M-g M-g|Goto line|
|M->|End|
|M-<|Start|

## Macros

I.e. record and playback

|**Command**|**Function**|
|-|-|
|C-x (|Start recording|
|C-x )|Finish reording|
|C-x e|Execute|
|.. c|Execute again|
|ESC *n* C-x e|Execute *n* times|

## Misc

|**Command**|**Function**|
|-|-|
|C-x C-t|Transpose lines|
|C-h t|Tutorial|
|C-h r|Manual|
|C-h C-h|Help about help|

## Key

* C = Ctrl
* M = Esc (usually)
