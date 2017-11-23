# PyHamcrest Matchers Cheatsheet

## Object

|**Command**|**Function**|
|-|-|
|equal_to|match equal object|
|has_length|match len()|
|has_property|match value of property with given name|
|has_properties|match an object that has all of the given properties.|
|has_string|match str()|
|instance_of|match object type|
|none, not_none|match None, or not None|
|same_instance|match same object|
|calling, raises|wrap a method call and assert that it raises an exception|

## Number

|**Command**|**Function**|
|-|-|
|close_to|match number close to a given value|
||greater_than, greater_than_or_equal_to, less_than, less_than_or_equal_to|match numeric ordering||

## Text

|**Command**|**Function**|
|-|-|
|contains_string|match part of a string|
|ends_with|match the end of a string|
|equal_to_ignoring_case|match the complete string but ignore case|
|equal_to_ignoring_whitespace|match the complete string but ignore extra whitespace|
|matches_regexp|match a regular expression in a string|
|starts_with|match the beginning of a string|
|string_contains_in_order|match parts of a string, in relative order|

## Logical

|**Command**|**Function**|
|-|-|
|all_of|and together all matchers|
|any_of|or together all matchers|
|anything|match anything, useful in composite matchers when you don’t care about a particular value|
|is_not|negate the matcher|

## Sequence

|**Command**|**Function**|
|-|-|
|contains|exactly match the entire sequence|
|contains_inanyorder|match the entire sequence, but in any order|
|has_item|match if given item appears in the sequence|
|has_items|match if all given items appear in the sequence, in any order|
|is_in|match if item appears in the given sequence|
|only_contains|match if sequence’s items appear in given list|
|empty|match if the sequence is empty|

## Dictionary

|**Command**|**Function**|
|-|-|
|has_entries|match dictionary with list of key-value pairs|
|has_entry|match dictionary containing a key-value pair|
|has_key|match dictionary with a key|
|has_value|match dictionary with a value|

## Decorator

|**Command**|**Function**|
|-|-|
|calling|wrap a callable in a deffered object, for subsequent matching on calling behaviour|
|raises|Ensure that a deferred callable raises as expected|
|described_as|give the matcher a custom failure description|
|is_|decorator to improve readability|see Syntactic sugar below|
