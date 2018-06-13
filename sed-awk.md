# sed and awk cheatsheet

`sed` and `awk` both read from stdin (or can be given a filename as an argument) and print to stdout.

## sed

### Recipies

|**Command**|**Function**|
|-|-|
|`sed s/foo/bar/g file.txt`|Replace `foo` (regexp) with `bar` in `file.txt`.|
|`sed 5 d`|Delete line 5.|
|`sed /foo/d`|Delete lines matching `foo`.|
|`sed -n 5,30 p`|Print lines 5 to 30.|
|`sed -n s/foo/bar/p`|Print only changed lines.|
|`sed i 17 foo`|Insert "foo" at line 17.|
|`sed /foo/a bar`|Append "bar" after lines containing "foo".|
|`sed s#foo#bar#g`|You don't have you use '/'s for regexes.|
|`seg G`|Double space input.|

### Command line options

|**Option**|**Effect**|
|-|-|
|-n|Supress normal output - use `p` to print|
|-i|Replace file in place. BSD sed requires a suffix.|

## awk

Basic structure:

    BEGIN {ACTION}
    CONDITION {ACTION}
    CONDITION {ACTION}
    END {ACTION}

|**Command**|**Function**|
|-|-|
|`awk -F, '{print $5}'`|Split on commas, print 5th token. `$NF` would give you the last.|
|`awk 'BEGIN {s = 0} {s += $3} END {print s}'`|Sum 3rd column.|
|`awk '/foo/ {print $0}'`|Print lines matching `foo`. `$0` is the whole line.|
|`awk '/foo/'`|As above - `print` is the default action.|
|`awk 'length($0)'`|Pring long lines.|

## grep

|**Command**|**Function**|
|-|-|
|`grep foo`|Include only lines condaining `foo`.|
|`grep -v foo`|Exclide lines containing `foo`.|
|`awk '/a/ && /b/ && !/c/ && /d/'`|Chained expressions - equivelent to `grep a | grep b | grep -v c | grep d`.|
