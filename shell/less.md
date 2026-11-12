# Less Cheatsheet

## General

|**Command**|**Function**|
|-|-|
|`q`|Quit|
|`R`|Refresh|
|`=` or `ctrl-g`|Show filename & position|

## Navigation

|**Command**|**Function**|
|-|-|
|`g`|Top|
|`G`|Bottom|
|`f`, `space` or `PgDn`|Forward one page|
|`b` or `PgUp`|Back one page|
|`d`|Forward ½ a page|
|`u`|Back ½ a page|
|`j`|Forward 1 line|
|`k`|Back one page|
|`%n`|Go to *n* percent of the file|
|`(`, `{` or `[`|Go to matching bracket|
|`:n`|Next file[^next]|
|`:p`|Previous file|

[^next]: When invoked with multiple or globbed files.

## Search

|**Command**|**Function**|
|-|-|
|`/foo`|Search for *foo*|
|`?foo`|Search backwards|
|`n`|Next match|
|`N`|Previous match|
|`/!foo`|Find lines not matching *foo*|
|`/*foo`|Find *foo* in all files|

## Misc

|**Command**|**Function**|
|-|-|
|`q`|Quit|
|`%foo`|Filter - show only lines containing *foo*|
|`F`|Follow mode|
|`-S`|Wrap on/off|
|`h`|Help|

## Command line options

|**Option**|**Function**|
|-|-|
|`-pfoo`|Search for *foo*|
|`+F`|Follow|
|`+G`|Go to bottom of file[^splat]|
|`-r`|Raw control characters[^raw]|

[^splat]: `+` trick works with any command
[^raw]: Might be colourful! (Or might break.)
