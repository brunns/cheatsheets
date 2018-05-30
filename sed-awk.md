# sed and awk cheatsheet

## sed

### Recipies

|**Command**|**Function**|
|-|-|
|`sed s/foo/bar/g file.txt`|Replace `foo` (regexp) with `bar` in `file.txt`|
|`sed 5d`|Attach to session|
|`sed /foo/d`|Delete lines matching `foo`|
|`sed -n 5,30 p`|Print lines 5 to 30|
|`-n`|List sessions|

### Command line options

|**Option**|**Effect**|
|-|-|
|-n|Supress normal output - use `p` to print|
|-i|Replace file in place. BSD sed requires a suffix.|


## awk

