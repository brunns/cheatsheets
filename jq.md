# `jq` Cheatsheet

[`jq`](https://jqlang.org/) is a command-line tool for processing JSON. A `jq` program is a "filter" that takes input JSON and produces output JSON. Filters are composed with the pipe operator `|`, much like Unix pipelines.

## CLI

|**Flag**|**Function**|
|-|-|
|`-c`|Compact output – one value per line, no pretty-printing|
|`-r`|Raw output – strings without JSON quoting|
|`-R`|Raw input – each input line is a string, not JSON|
|`-s`|Slurp – read all inputs into an array, run filter once|
|`-n`|Null input – don't read input; run filter once on `null`|
|`-C`|Coloured output (force)|
|`-M`|Monochrome output (force)|
|`-S`|Sort object keys in output|
|`-a`|ASCII output – escape non-ASCII characters|
|`--arg `*`name val`*|Bind `$name` to string *val*|
|`--argjson `*`name json`*|Bind `$name` to JSON value *json*|
|`--slurpfile `*`name file`*|Bind `$name` to array of JSON values in *file*|
|`--rawfile `*`name file`*|Bind `$name` to raw content of *file*|
|`-e`|Set exit status from last output (`0` if `true`/not `null`, `1` otherwise)|
|`-f `*`file`*|Read filter from *file*|

## Basic filters

|**Filter**|**Function**|
|-|-|
|`.`|Identity – pass input through unchanged[^pretty]|
|`.foo`|Value of key `"foo"` in an object[^dotkey]|
|`.foo.bar`|Nested field access – shorthand for `.foo \| .bar`|
|`.["foo.bar"]`|Field access for keys with special characters|
|`.foo?`|Same as `.foo`, but no error if input is not an object|
|`.[n]`|Array element at index *n* (0-based). Negative `n` counts from end|
|`.[n:m]`|Slice array elements *n* to *m* (exclusive)|
|`[]`/`.[]`|Iterate all elements of array, or values of object[^iter]|
|`[]?`/`.[]?`|Same, but no error if input is not an array or object|
|`..`|Recursive descent – emit every value in nested structure|

[^pretty]: `jq '.'` just parses and pretty-prints JSON – useful for validation.
[^dotkey]: Only works for identifier-like keys (alphanumeric + underscore, not starting with digit).
[^iter]: Acts as a generator — emits each element as a separate result.

## Operators

|**Operator**|**Function**|
|-|-|
|`|`|Pipe – feed output of left into input of right|
|`,`|Comma – concatenate output of two filters|
|`+`|Add numbers, concatenate arrays/strings, merge objects|
|`-`|Subtract numbers, or remove array elements|
|`*`|Multiply numbers, merge objects recursively|
|`/`|Divide numbers, or split string by separator|
|`%`|Modulo|
|`==`, `!=`|Equality / inequality|
|`<`, `>`, `<=`, `>=`|Comparison[^order]|
|`and`, `or`, `not`|Boolean operators[^bool]|
|`//`|Alternative – produce values of *a* that aren't `false`/`null`, otherwise *b*[^alt]|
|`?`|Error suppression – shorthand for `try EXP`|

[^order]: Sort order: `null`, `false`, `true`, numbers, strings, arrays, objects.
[^bool]: `not` is a function (pipe it in): `.foo and .bar \| not`. `false` and `null` are "falsy".
[^alt]: `.foo // 42` produces `42` if `.foo` is missing or `null`/`false`. For a *generator* `g`, `g // 42` only defaults if `g` produces no valid values at all; `g | . // 42` defaults each empty result.

## Types & type checks

|**Filter**|**Function**|
|-|-|
|`type`|Returns type name: `"null"`, `"boolean"`, `"number"`, `"string"`, `"array"`, `"object"`|
|`nulls`, `booleans`, `numbers`, `strings`|Filter to only values of that type|
|`arrays`, `objects`, `iterables`|Filter to only arrays, objects, or either|
|`scalars`|Non-array, non-object values|
|`values`|Non-`null` values|
|`tonumber`|Parse string as number|
|`toboolean`|Parse string as boolean|
|`tostring`|Convert to string (JSON-encode non-strings)|
|`tojson`|Stringify to JSON text (strings get quoted)|
|`fromjson`|Parse JSON text to value|

## Arrays

|**Filter**|**Function**|
|-|-|
|`length`|Number of elements|
|`map(f)`|Apply filter *f* to each element, collect to array|
|`map_values(f)`|Apply *f* to each value of object, collect to object|
|`add`|Sum numbers, concat arrays/strings, merge objects[^add]|
|`add(gen)`|Same, operating on a generator|
|`flatten`|Recursively flatten nested arrays|
|`flatten(n)`|Flatten *n* levels deep|
|`reverse`|Reverse an array|
|`sort`|Sort array (by type order)|
|`sort_by(exp)`|Sort by result of *exp* on each element|
|`group_by(exp)`|Group by *exp*; result is array of arrays|
|`unique`|Remove duplicates (sorted)|
|`unique_by(exp)`|Remove duplicates by key produced by *exp*|
|`min`, `max`|Minimum / maximum element|
|`min_by(exp)`, `max_by(exp)`|By key produced by *exp*|
|`any`, `all`|True if any / all booleans in array are true|
|`any(cond)`, `all(cond)`|Apply *cond* to each, then check|
|`contains(val)`|True if array/object/string contains *val*|
|`index(val)`, `rindex(val)`|First / last index of *val*|
|`indices(val)`|All indices where *val* occurs|
|`bsearch(val)`|Binary search on sorted array; negative result gives insertion point|
|`range(n)`|[0..n) as array of numbers|
|`range(from;upto)`|Numbers *from* (inclusive) to *upto* (exclusive)|
|`range(from;upto;by)`|With step *by*|
|`transpose`|Transpose a matrix (row/column swap, padded with `null`)|

[^add]: On empty array, returns `null`.

## Objects

|**Filter**|**Function**|
|-|-|
|`keys`|Keys in an array (sorted)|
|`keys_unsorted`|Keys in insertion order|
|`has(key)`|True if object has *key* or array has element at that index|
|`in(obj)`|True if input is a key of *obj* (inverse of `has`)|
|`del(path)`|Delete key(s)/index from object or array|
|`delpaths([[..]])`|Delete multiple paths at once|
|`getpath([..])`|Get value(s) at path(s)|
|`setpath([..]; val)`|Set value at path|
|`to_entries`|Object → array of `{"key":k, "value":v}`|
|`from_entries`|Array of `{"key":k, "value":v}` → object|
|`with_entries(f)`|Transform each key-value pair, then rebuild object[^we]|
|`+`|Merge objects (right wins on conflict)|
|`*`|Recursive merge of objects|
|`pick(.a, .b)`|Project object down to given paths|

[^we]: `with_entries(f)` ≡ `to_entries \| map(f) \| from_entries`.

## Strings

|**Filter**|**Function**|
|-|-|
|`split("sep")`|Split string by *sep*|
|`join("sep")`|Join array elements with *sep*|
|`length`|Number of Unicode codepoints|
|`utf8bytelength`|Number of UTF-8 bytes|
|`explode`|Array of codepoint numbers|
|`implode`|Codepoint numbers → string|
|`trim`, `ltrim`, `rtrim`|Trim leading/trailing whitespace|
|`trimstr(s)`, `ltrimstr(s)`, `rtrimstr(s)`|Strip prefix/suffix/both *s*|
|`startswith(s)`, `endswith(s)`|True if string starts/ends with *s*|
|`ascii_upcase`, `ascii_downcase`|Case conversion (ASCII only)|
|`@json`|Escape as JSON string|
|`@text`|Same as `tostring`|
|`@html`|HTML/XML entity escaping|
|`@uri`|URL percent-encoding|
|`@urid`|URL percent-decoding|
|`@csv`|Array → CSV (double-quoted strings)|
|`@tsv`|Array → tab-separated values|
|`@sh`|Shell-safe escaping|
|`@base64`, `@base64d`|Base64 encode / decode|

String interpolation: `"hello \(.name)"` — interpolates a jq expression[^interp]. `@uri "q=\(.search)"` escapes only the interpolated part.

[^interp]: Use `\(...)`, not `${...}` or `#{...}`.

## Conditionals & control flow

|**Construct**|**Function**|
|-|-|
|`if a then b else c end`|If-then-else|
|`if a then b end`|Shorthand for `else . end`|
|`if a then b elif c then d else e end`|Multi-branch|
|`select(cond)`|Emit input if *cond* is true, else nothing|
|`try exp`|Catch error silently (equiv. `try exp catch empty`)|
|`try exp catch handler`|Catch error, run *handler* with error message on input|
|`while(cond;update)`|Repeat *update* while *cond* is true|
|`until(cond;next)`|Repeat *next* until *cond* is true|
|`repeat(exp)`|Repeat *exp* until error|
|`reduce exp as $x (init; update)`|Fold over a generator|
|`foreach exp as $x (init; cond; update)`|Like `reduce` but with separate condition|
|`recurse(f)`|Recurse into result of *f*|
|`recurse`|Recurse through `.[]?` (all values)|
|`walk(f)`|Apply *f* to every node, depth-first|
|`label $x \| ... break $x`|Break out of loops / control structures|

## Variables & environment

|**Construct**|**Function**|
|-|-|
|`. as $x \| ...`|Bind current output to `$x`|
|`$ENV.FOO`|Environment variable *FOO*|
|`env.FOO`|Same as `$ENV.FOO`|
|`--arg name val`|Bind `$name` to string *val*|
|`--argjson name json`|Bind `$name` to JSON *json*|
|`$ARGS.named.name`|Named argument passed via `--arg`[^args]|
|`$ARGS.positional[name]`|Positional argument[^args]|

[^args]: `--args` / `--jsonargs` make remaining CLI args available.

## Shell integration

|**Example**|**Function**|
|-|-|
|`jq '.foo' file.json`|Read *file.json*, print `.foo`|
|`curl -s url \| jq '.foo'`|Fetch JSON and process[^safe]|
|`jq -r '.foo' file`|Print `.foo` as raw string|
|`jq -cn '[1]+[2]'`|Compute without reading input[^nc]|
|`jq -n '{n: \(date +%s)}'`|Construct JSON from commands|
|`jq -n --arg x $X '{$x: $x}'`|Safe shell-variable → JSON|
|`export $(jq -r '@sh "A=\(.a)"' file)`|Export JSON fields to shell env|

[^safe]: When *url* is trusted. For untrusted: `curl -sL --fail-with-body url \| jq ...`.
[^nc]: `-c` compact, `-n` no input.

## Recipes

|**Recipe**|**Command**|
|-|-|
|Pretty-print|`jq '.'`|
|Compact|`jq -c '.'`|
|Validate|`jq -e '.' >/dev/null`[^exit]|
|Field|`jq '.foo.bar'`|
|All elements|`jq '.items[]'`|
|Subset|`jq '{a, b: .b.c}'`|
|Delete field|`jq 'del(.secret)'`|
|Add field|`jq '. + {z: 9}'`|
|Filter by value|`jq 'map(select(.status == "ok"))'`|
|Sort by field|`jq 'sort_by(.name)'`|
|Group by field|`jq 'group_by(.type)'`|
|Unique by field|`jq 'unique_by(.id)'`|
|Count|`jq '.items \| length'`|
|Flatten nested|`jq 'flatten'`|
|Sum|`jq '.items \| add'`[^sum]|
|Max/Min|`jq '[.items \| min, .items \| max]'`|
|Rename key|`jq 'with_entries(.key \| sub("^_"; ""))'`|
|Keys as values|`jq 'with_entries(.value = .key)'`|

[^exit]: `-e` sets exit status: `0` if output wasn't `false`/`null`, `1` if it was.
[^sum]: `add` on an empty array returns `null`; on a single-element array returns that element.

## Advanced patterns

Flatten object to `key=value` lines:

    jq -r 'paths(scalars) as $p | getpath($p) as $v | "\($p | join("."))=\($v)"'

Append to a nested array (by index):

    jq '.widgets[0].properties += ["x"]'

Nested key filtering, then rebuild:

    jq '.data | to_entries | map(select(.key | startswith("x")) | select((. | .value | .id) != 1)) | from_entries'

Collect a nested field across an array into a single-key object:

    jq '[{field: (.items[] | .nested.ref)}] | add'

Group by a nested key, producing a map:

    jq 'group_by(.ref.id) | map({key: .[0].ref.id, value: [.]}) | from_entries'
