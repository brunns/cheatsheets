# Emacs Cheatsheet

## General

|**Command**|**Function**|
|-|-|
|C-g|Cancel|
|C-/|Undo|
|C-x C-c|Quit|
|F10|Menu|
|M-x ansi-term|Open terminal|

## Files

|**Command**|**Function**|
|-|-|
|C-x C-f|Open file|
|C-x C-s|Save file|
|C-x C-w|Save as|
|C-x s|Save all buffers|

## Editing

|**Command**|**Function**|
|-|-|
|C-k|Delete to end of line|
|C-DEL|Delete next word|
|M-BKS|Delete pevious word|
|M-^|Join with previous line|
|M-t|Transpose word to right|
|C-x C-t|Transpose lines[^1]|

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
|M-v replace-regexp RET *pattern* RET *replacement*|Regexp replace|

### Query replace

|**Command**|**Function**|
|-|-|
|ESC % RET *replace* RET *replacement*|Query replace|
|Space or y|Replace|
|DEL or n|Skip|
|!|Replace all|
|RTN or q|Quit|

## Buffers and Windows

|**Command**|**Function**|
|-|-|
|C-x b|Switch to buffer (by name)|
|C-x C-b|List buffers (and select)|
|C-x →|Next buffer|
|C-x ←|Previous buffer|
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
|.. e|Execute again|
|ESC *n* C-x e|Execute *n* times|

## Python

|**Command**|**Function**|
|-|-|
|C-c !|Python shell|
|C-c C-c|Execute current buffer|
|C-c C-t|insert `import ipdb; ipdb.set_trace()`|

## Misc

|**Command**|**Function**|
|-|-|
|C-h t|Tutorial|
|C-h r|Manual|
|C-h C-h|Help about help|
|M-x load-theme|Load theme|
|C-x * Q|Quick calc|

## Init options

In `~/.emacs`, or (better) `~/.emacs.d/init.el`, probably. Example:

    ;; Theme
    (load-theme 'deeper-blue)

## Key

|**Symbol**|**Key**|
|-|-|
|C|Ctrl|
|M|Meta, usually Alt.|

[^1]: Move the line above, and the cursor, both down one line.
