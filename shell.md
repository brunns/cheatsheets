# Shell Magic

Various shell tricks

## History Interaction[^refp]

```
![event][:word][:modifier]
    |      |        |
    |      |        '--> modifier [  :h  :t  :r  :e  ... ]
    |      '-----------> part     [  :0  :$  :*  :2-3 ... ]
    '------------------> line     [  !!  !-2  !ssh  !?word? ... ]
```

[^refp]: Thanks to [A shell exclamation mark is not for yelling. Be lazy.](https://refp.se/articles/your-shell-and-the-lazy-exclamation-mark) for much of this.

### Event Designators

|**Designator**|**Function**|
|-|-|
|`!!`|Previous command. (Synonym for `!-1`)|
|`!`|Previous command, if followed by a word designator|
|`!-n`|Command *n* lines back|
|`!str`|Most recent command starting with "str".|
|`!?str?`|Most recent command containing "str".|
|`^str1^str2^`|Repeat  last command, replacing "str1" with "str2". Equivalent to `!!:s/str1/str2/`|

### Word Designators

Example command: `a/b c "d e" f/g/h.i`

|**Designator[^owd]**|**Function**|**Example**|
|-|-|-|
|`n`|*n*th word, zero indexed|`!:1`→`c`|
|`$`|Last word|`!$`→`f/g/h.i`|
|`^`|1st word|`!^`→`c`|
|`*`|All but 0th word|`!*`→`c "d e" f/g/h.i`|
|`n-m`|*n*th to *m*th words, zero indexed|`!:1-2`→`c "d e"`|
|`n*`|Abbr for `n-$`|`!:2*`→`"d e" f/g/h.i`|
|`-n`|Abbr for `0-n`|`!:-2`→`a/b c "d e"`|

[^owd]: Preceding `:` can be omitted if word designator begins with `$`, `^` or `*`.

### Modifiers

|**Modifier**|**Function**|**Example**|
|-|-|-|
|`h`|Directory name|`!!:h`→`f/g`|
|`t`|Base name|`!!:t`→`h.i`|
|`r`|Strip off extension|`!!:r`→`f/g/h`|
|`e`|Only extension|`!!:e`→`i`|
|`t:r`|Chained modifiers|`!!:t:r`→`h`|
|`s/from/to/`|Replace `from` with `to`|`!!:t:s/i/x/`→`h.x`|
|`p`|Print only||

### Common uses

+--------------------------+-----------------------------------------+
| **Recipe**               | **Function**                            |
+==========================+=========================================+
| `!!`                     | Previous command                        |
+--------------------------+-----------------------------------------+
| `!str`                   | Most recent command starting with `str` |
+--------------------------+-----------------------------------------+
| `!?str?`                 | Most recent command containing `str`    |
+--------------------------+-----------------------------------------+
| `!$`                     | Last argument of previous command[^ad]  |
+--------------------------+-----------------------------------------+
| `!:0`                    | Script name of previous command         |
+--------------------------+-----------------------------------------+
| `!$:h`                   | Directory of last argument              |
+--------------------------+-----------------------------------------+
|  `!$:t`                  | Filename of last argument               |
+--------------------------+-----------------------------------------+
| `$ mkdir -p foo/bar/baz` | Make directory                          |
|                          |                                         |
| `$ cd !$`                | cd into new directory                   |
+--------------------------+-----------------------------------------+
| `$ touch foo/bar.txt`    | Create file                             |
|                          |                                         |
| `$ cd !$:h`              | cd into new file's dir                  |
+--------------------------+-----------------------------------------+

[^ad]: Try also ⌥. or ⎋. on Mac.

## fc

|**Command**|**Function**|
|-|-|
|`fc`|Edit last command[^editor] & run|
|`fc -2`|Edit command before last|
|`fc str`|Edit last command starting with `str`|

[^editor]: Using whatever you have set for `$FCEDIT`, falling back to `$EDITOR` . Use `-e` flag to override.

## fzf

|**Command**|**Function**|
|-|-|
|⌃t|File picker|
|⌃r|Command history|
|⌥c|Pick directory & `cd` to it|
|`somecmd **`⇥|Pick argument[^fzfarg] for `somecmd`|

[^fzfarg]: Files and directories, process IDs, Environment variables of host names depending upon context.

## Misc

|**Command**|**Function**|
|-|-|
|`cd -`|`cd` to previous `pwd`|

## Keys

|**Symbol**|**Key**|
|-|-|
|⇧|Shift|
|⌃|Control|
|⌘|Command|
|⌥|Option (Alt)|
|⎋|Escape|
|↵|Return|
|⇥|Tab|
|↓←↑→|Arrow keys|
