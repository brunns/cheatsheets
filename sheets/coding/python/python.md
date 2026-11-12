# Python Reference

## strftime

### Date

|Code|Meaning|Example|
|-|-|-|
|`%a`|Weekday as locale's abbreviated name.|Mon|
|`%A`|Weekday as locale's full name.|Monday|
|`%w`|Weekday as a decimal number, where 0 is Sunday and 6 is Saturday.|1|
|`%d`|Day of the month as a zero-padded decimal number.|30|
|`%-d`|Day of the month as a decimal number. (Platform specific)|30|
|`%b`|Month as locale's abbreviated name.|Sep|
|`%B`|Month as locale's full name.|September|
|`%m`|Month as a zero-padded decimal number.|09|
|`%-m`|Month as a decimal number. (Platform specific)|9|
|`%y`|Year without century as a zero-padded decimal number.|13|
|`%Y`|Year with century as a decimal number.|2013|
|`%j`|Day of the year as a zero-padded decimal number.|273|
|`%-j`|Day of the year as a decimal number. (Platform specific)|273|
|`%U`|Week number of the year (Sunday as the first day of the week) as a zero padded decimal number. All days in a new year preceding the first Sunday are considered to be in week 0.|39|
|`%W`|Week number of the year (Monday as the first day of the week) as a decimal number. All days in a new year preceding the first Monday are considered to be in week 0.|39|

### Time

|Code|Meaning|Example|
|-|-|-|
|`%H`|Hour (24-hour clock) as a zero-padded decimal number.|07|
|`%-H`|Hour (24-hour clock) as a decimal number. (Platform specific)|7|
|`%I`|Hour (12-hour clock) as a zero-padded decimal number.|07|
|`%-I`|Hour (12-hour clock) as a decimal number. (Platform specific)|7|
|`%p`|Locale's equivalent of either AM or PM.|AM|
|`%M`|Minute as a zero-padded decimal number.|06|
|`%-M`|Minute as a decimal number. (Platform specific)|6|
|`%S`|Second as a zero-padded decimal number.|05|
|`%-S`|Second as a decimal number. (Platform specific)|5|
|`%f`|Microsecond as a decimal number, zero-padded on the left.|000000|

### Time zone

|Code|Meaning|Example|
|-|-|-|
|`%z`|UTC offset in the form +HHMM or -HHMM (empty string if the the object is naive).| |
|`%Z`|Time zone name (empty string if the object is naive).| |

### Locale

|Code|Meaning|Example|
|-|-|-|
|`%c`|Locale's appropriate date and time representation.|Mon Sep 30 07:06:05 2013|
|`%x`|Locale's appropriate date representation.|09/30/13|
|`%X`|Locale's appropriate time representation.|07:06:05|

### Misc

|Code|Meaning|Example|
|-|-|-|
|`%%`|A literal '%' character.|%|

```{=typst}
#pagebreak()
```

## Format specifications

Used by f-strings, `str.format()` and the `Formatter` class.

### Format field syntax

```
{field_name !conversion :format_spec}
format_spec: [[fill][align]][sign]["z"]["#"]["0"][width][,|_][.precision][,|_][type]
```

|Part|Meaning|Example|
|-|-|-|
|`field_name`|Arg name or index; supports `.attr` / `[idx]`|`{0}` `{name}` `{name.upper}` `{lst[0]}`|
|`!conversion`|Force coercion before formatting|`{val!r}`|
|`format_spec`|Alignment, width, precision, type|`{val:>10.2f}`|
|`{{` `}}`|Escape `{` / `}`|`"{{literal}}"`|

### Alignment & fill

|Code|Meaning|Example|
|-|-|-|
|`<`|Left-align (default for strings)|`{'hi':<10}` → `hi         `|
|`>`|Right-align (default for numbers)|`{'01':>10}` → `         01`|
|`^`|Center|`{'hi':^10}` → `    hi      `|
|`=`|Fill after sign, before digits|`{'12':0=5d}` → `0001`|
|Any char before align|Pad with that char|`{'hi':*>10}` → `********hi`|

### Conversion (`!` flag)

|Code|Meaning|Example|
|-|-|-|
|`!s`|Call `str()` first|`{val!s}`|
|`!r`|Call `repr()` first|`{val!r}` → `'hello'`|
|`!a`|Call `ascii()` first|`{val!a}`|

### Sign & special options (numeric only)

|Code|Meaning|Example|
|-|-|-|
|`+`|Show sign for both positive and negative|`{:+d}` → `+12`|
|`-`|Show sign only for negative (default)|`{:-d}`|
|` ` (space)|Leading space for positive|`{: d}` → ` 12`|
|`#`|Alternate form: `0x`,`0o`,`0b` prefix for int; force decimal point for float|`{:#x}` → `0xff`|
|`z`|Coerce −0.0 to +0.0|`{-0.0:z.1f}` → `0.0`|
|`0` (before width)|Zero-pad with sign awareness|`{010d}` → `0000000012`|
|`,` / `_`|Group thousands with comma / underscore|`{:,d}` → `1,000,000`|

### Numeric type codes (integers)

|Code|Meaning|Example|
|-|-|-|
|`d`|Decimal (default)|`{123d}`|
|`b`|Binary|`{5:#b}` → `0b101`|
|`o`|Octal|`{9:#o}` → `0o11`|
|`x`|Hex lower-case|`{255:#x}` → `0xff`|
|`X`|Hex upper-case|`{255:#X}` → `0XFF`|
|`c`|Unicode char from codepoint|`{65c}` → `A`|
|`n`|Locale-aware grouping|`{1000000:n}` with `locale`|

### Numeric type codes (floats / Decimal)

|Code|Meaning|Example|
|-|-|-|
|`f`|Fixed-point|`{3.14159:.2f}` → `3.14`|
|`F`|Fixed-point, `INF`/`NAN` uppercased|`{inf:.1F}` → `INF`|
|`e`|Scientific notation|`{3.14159:.2e}` → `3.14e+00`|
|`E`|Scientific, upper-case `E`|`{3.14159:.2E}` → `3.14E+00`|
|`g`|General (picks `f` or `e` by magnitude)|`{3.14159:.3g}` → `3.14`|
|`G`|General with `E`|`{3.14159:.3G}` → `3.14`|
|`%`|Percentage (×100 + `%`)|`{0.5:.1%}` → `50.0%`|
|`n`|General, locale-aware|`{3.14159:,.3n}`|

### Width & precision

|Part|Meaning|Example|
|-|-|-|
|`width`|Min total field width (includes sign/padding)|`{val:>10}`|
|`.precision`|Float: digits after `.`; String: max chars; `g`/`G`: sig digits|`{:.3f}`|
|No width|Field = content length|`{val}`|
|Precision for string|Truncate to N chars|`{:.5s}` → `hello`|

### String formatting

|Code|Meaning|Example|
|-|-|-|
|`s` or `None`|Default string format|`{name:<20}`|
|Precision|Max characters taken|`{'hello world':.8}` → `hello wo`|
|Alignment / Fill|Works as with numbers|`{name:*>20}`|
|`#`|**Not valid** for strings|—|
|Sign|**Not valid** for strings|—|

### Nested format specs

The `format_spec` itself can contain nested `{fields}` — resolved before the outer spec is processed. Only one level of nesting is allowed.

```python
'{0:{width}}'.format('hi', width=10)              # 'hi         '
'{0:{fill}{align}10}'.format(x, fill='*', align='<')
'{:0{width}d}'.format(42, width=5)               # '00042'
```

### Date/time in format specs

Use `{dt:%Y-%m-%d %H:%M}` with a `datetime` object to delegate to `strftime`. See the **strftime** table above for all codes.

```{=typst}
#pagebreak()
```

## regex

### Module functions

|Function|Description|
|-|-|
|`re.compile(pattern, flags=0)`|Compile a pattern into a reusable Pattern object|
|`re.match(pattern, string, flags=0)`|Match at the **start** of string; return Match or `None`|
|`re.search(pattern, string, flags=0)`|Find first match **anywhere** in string|
|`re.fullmatch(pattern, string, flags=0)`|Match the **entire** string; return Match or `None`|
|`re.findall(pattern, string, flags=0)`|All non-overlapping matches as list; tuples if capturing groups|
|`re.finditer(pattern, string, flags=0)`|Lazily yield Match objects for all matches|
|`re.split(pattern, string, maxsplit=0, flags=0)`|Split string by pattern; capturing groups included in result|
|`re.sub(pattern, repl, string, count=0, flags=0)`|Replace occurrences of pattern with repl (str or callable)|
|`re.subn(pattern, repl, string, count=0, flags=0)`|Like `sub`, returns `(new_string, num_subs)`|
|`re.escape(pattern)`|Escape all regex metacharacters in a literal string|
|`re.purge()`|Clear the internal compile cache|

Replacement-string backreferences: `\g<name>` (named group), `\g<1>` (by number), `\1` (single digit). Unknown `\x` letter escapes raise an error.

### Patterns

#### Anchors and boundaries

|Code|Meaning|
|-|-|
|`^`|Start of string; start of each line with `re.M`|
|`$`|End of string or just before trailing `\n`; end of each line with `re.M`|
|`\A`|Only at the very start of string (unaffected by `re.M`)|
|`\Z` / `\z`|Only at the very end of string|
|`\b`|At a word boundary (between `\w` and `\W`, or string edge and `\w`)|
|`\B`|Not at a word boundary|

#### Quantifiers

|Code|Meaning|Example|
|-|-|-|
|`*`|0 or more (greedy)|`ab*` → `a`, `ab`, `abb`…|
|`+`|1 or more (greedy)|`ab+` → `ab`, `abb`…|
|`?`|0 or 1 (greedy)|`ab?` → `a` or `ab`|
|`{m}`|Exactly *m* times|`a{3}` → `aaa`|
|`{m,n}`|*m* to *n* times (greedy)|`a{2,4}` → `aa`…`aaaa`|
|`*?` `+?` `??`|Non-greedy (minimal) variants|`<.*?>` matches shortest tag|
|`{m,n}?`|Non-greedy range|`a{3,5}?` on `'aaaaaa'` → 3 `a`s|
|`*+` `++` `?+`|Possessive (no back-tracking)*|`a*+a` fails on `'aaaa'`|
|`{m,n}+`|Possessive range|`a{3,5}+aa`|

*\*Added in Python 3.11.*

#### Dot, character classes, and metacharacter escaping

|Code|Meaning|
|-|-|
|`.`|Any char except `\n` (or any char with `re.S`)|
|`(?s:.)`|Dot matches any char regardless of active flags|
|`[...]`|Any one char in the set; ranges with `-` e.g. `[a-z]`; `]` escaped `[\]]` or first|
|`[^...]`|Any char **not** in the set|
|`\|`|Literal pipe character|
|`\.` `\*` `\+` `\?` `\{` `\}` `\[` `\]` `\(` `\)` `\^` `\$` `\\`|Escape metacharacter for literal matching|

#### Shorthand character classes

|Code|Meaning|ASCII mode (`re.A`)|
|-|-|-|
|`\d`|Any Unicode decimal digit|`[0-9]`|
|`\D`|Not a decimal digit|`[^0-9]`|
|`\w`|Word character (`a–z A–Z 0–9 _` + Unicode alnum)|`[a-zA-Z0-9_]`|
|`\W`|Not a word character|`[^a-zA-Z0-9_]`|
|`\s`|Whitespace (`space \t \n \r \f \v` + Unicode spaces)|`[ \t\n\r\f\v]`|
|`\S`|Not whitespace|`[^ \t\n\r\f\v]`|

#### Groups, backreferences, and lookarounds

|Code|Meaning|
|-|-|
|`(...)`|Capture group; retrievable via `m.group(n)`|
|`(?:...)`|Non-capturing group|
|`(?P<name>...)`|Named capture group|
|`(?P=name)`|Backreference to named group `name`|
|`\n` (n = 1–99)|Backreference to group *n*|
|`\g<name>` / `\g<n>` in repl|Named / numbered backref in `sub()`|
|`(?=...)`|Positive lookahead assertion|
|`(?!...)`|Negative lookahead assertion|
|`(?<=...)`|Positive lookbehind (fixed-length only)|
|`(?<!...)`|Negative lookbehind (fixed-length only)|
|`(?>...)`|Atomic group (no back-tracking inside)|
|`(?#...)`|Comment — ignored by regex engine|
|`(?flags:...)`|Scoped inline flags|

Inline flag letters (`a`, `i`, `L`, `m`, `s`, `u`, `x`) can be combined, e.g. `(?i:...)`, `(?im:...)`. Letters `a`, `L`, `u` are mutually exclusive.

#### Flags

Combine with `|`, e.g. `flags=re.I | re.M`. Can also be set inline with `(?i:...)`.

|Flag|Alias|Meaning|
|-|-|-|
|`re.IGNORECASE`|`re.I`|Case-insensitive; `[A-Z]` also matches `a–z`|
|`re.MULTILINE`|`re.M`|`^`/`$` match start/end of each line, not just string|
|`re.DOTALL`|`re.S`|`.` matches `\n` as well|
|`re.VERBOSE`|`re.X`|Whitespace in pattern ignored outside sets; `#` starts a comment|
|`re.ASCII`|`re.A`|`\w`, `\d`, `\s`, `\b` etc. match ASCII only|
|`re.UNICODE`|`re.U`|Unicode matching (redundant in Python 3; kept for compat)|
|`re.LOCALE`|`re.L`|Locale-dependent matching — **bytes patterns only** (discouraged)|
|`re.NOFLAG`|—|Sentinel — value `0`, useful as a default parameter|
