# tmux cheatsheet

## CLI options

|**Command**|**Function**|
|-|-|
|`tmux`|New session|
|`tmux a`|Attach to session|
|`tmux new -s `*`foo`*|New session named *foo*|
|`tmux a -t `*`foo`*|Attach to session named *foo*|
|`tmux ls`|List sessions|

## Commands

|**Command**|**Function**|
|-|-|
|^n d|Detach session|
|^b c|New window|
|^b n|Next window|
|^b p|Previous window|
|^d *or* ^b x|Close window|
|^b ,|Name window|
|^b w|List windows|
|^b *n*|Switch to window *n*|
|^b %|Split window vertically|
|^b "|Split window horizontally|
|^b o|Switch to next pane|
|^b ;|Switch to previous pane|

## screen (for when tmux isn't available)

Start with `screen -dRR` - will reattach or create.

|**Command**|**Function**|
|-|-|
|^a d|Detach|
|^a c|New window|
|^a ^a|Switch to last window|
|^a "|Window list & selection|
|^a S|Split vertically|
|^a W|Split horizontally|
|^a tab|Switch panes|
|^a X|Close current pane|
|^a Q|Close other panes|
