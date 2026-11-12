# PyHamcrest Matchers Cheatsheet

## PyHamcrest

### Object

|**Matcher**|**Function**|
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

### Number

|**Matcher**|**Function**|
|-|-|
|close_to|match number close to a given value|
||greater_than, greater_than_or_equal_to, less_than, less_than_or_equal_to|match numeric ordering||

### Text

|**Matcher**|**Function**|
|-|-|
|contains_string|match part of a string|
|ends_with|match the end of a string|
|equal_to_ignoring_case|match the complete string but ignore case|
|equal_to_ignoring_whitespace|match the complete string but ignore extra whitespace|
|matches_regexp|match a regular expression in a string|
|starts_with|match the beginning of a string|
|string_contains_in_order|match parts of a string, in relative order|

### Logical

|**Matcher**|**Function**|
|-|-|
|all_of|and together all matchers|
|any_of|or together all matchers|
|anything|match anything, useful in composite matchers when you don’t care about a particular value|
|is_not|negate the matcher|

### Sequence

|**Matcher**|**Function**|
|-|-|
|~~contains~~|deprecated - use `contains_exactly`|
|contains_exactly|exactly match the entire sequence|
|contains_inanyorder|match the entire sequence, but in any order|
|has_item|match if given item appears in the sequence|
|has_items|match if all given items appear in the sequence, in any order|
|is_in|match if item appears in the given sequence|
|only_contains|match if sequence’s items appear in given list|
|empty|match if the sequence is empty|

### Dictionary

|**Matcher**|**Function**|
|-|-|
|has_entries|match dictionary with list of key-value pairs|
|has_entry|match dictionary containing a key-value pair|
|has_key|match dictionary with a key|
|has_value|match dictionary with a value|

### Decorator

|**Matcher**|**Function**|
|-|-|
|calling|wrap a callable in a deffered object, for subsequent matching on calling behaviour|
|raises|Ensure that a deferred callable raises as expected|
|described_as|give the matcher a custom failure description|
|is_|decorator to improve readability|see Syntactic sugar below|

## brunns.matchers

### Bytestring

|**Matcher**|**Function**|
|-|-|
|contains_bytestring|match if bytestring contains another.|

### JSON

|**Matcher**|**Function**|
|-|-|
|json_matching|match JSON string.|

### Date & time

|**Matcher**|**Function**|
|-|-|
|is_weekday|matches date if it’s a weekday.|

### Database

|**Matcher**|**Function**|
|-|-|
|has_table|matches if database has table.|
|has_table_with_rows|matches if database has table with rows matching.|

### HTML

|**Matcher**|**Function**|
|-|-|
has_title|matches if HTML has title with content.|
has_named_tag|matches if HTML has tag with name.|
has_id_tag|matches if HTML has tag with id.|
tag_has_string|matches if tag has string.|
has_class|matches if tag has class.|
has_table|matches if HTML has table.|
has_row|matches if table has row.|
has_header_row|matches if table has header row.|
has_id|matches if tag has id.|
has_attributes|matches if tag has attributes.|
has_link|matches if HTML has link.|
has_image|matches if HTML has image.|

### Matchers

|**Matcher**|**Function**|
|-|-|
mismatches|matches if matcher mismatches value.|
mismatches_with|matches if matcher mismatches value with specific message.|
matches|matches if matcher matches value.|
matches_with|matches if matcher matches value with specific message.|

### Meta (auto-matchers)

Dynamically create matchers for classes. Use like so:

```python
@dataclass
class Status:
    id: int
    code: str
    reason: Optional[str] = None

class StatusMatcher(BaseAutoMatcher[Status]): ...

def is_status() -> Matcher[Status]: return StatusMatcher()

actual = Status(code="ACTIVE", id=99)
assert_that(actual, is_status().with_code(starts_with("ACT")).and_reason(None))
```

Works only for classes with `__annotations__`; typically manually annotated classes, `dataclasses.dataclass` and `pydantic.BaseModel` instances.

### Mocks

|**Matcher**|**Function**|
|-|-|
|has_call|matches if mock has a specific call.|
|call_has_arg|matches if a call has a specific argument.|
|call_has_args|matches if a call has specific arguments.|

### Object

|**Matcher**|**Function**|
|-|-|
|has_repr|matches if object’s repr() matches.|
|has_identical_properties_to|matches if object has identical properties to another.|
|true|matches if object is truthy.|
|false|matches if object is falsy.|
|between|matches if value is within a range.|

### Path

|**Matcher**|**Function**|
|-|-|
|is_path|matches a pathlib.Path object.|

### Response

|**Matcher**|**Function**|
|-|-|
|is_response|matches requests or httpx response.|
|redirects_to|matches if response redirects to URL.|

### RSS

|**Matcher**|**Function**|
|-|-|
|is_rss_feed|matches if string is a valid RSS feed.|
|is_rss_entry|matches if object is an RSS feed entry.|

### Scripttest

|**Matcher**|**Function**|
|-|-|
|is_proc_result|matches scripttest ProcResult from command execution.|

### SMTP

|**Matcher**|**Function**|
|-|-|
|is_email|matches if string is a valid email message.|

### URL

|**Matcher**|**Function**|
|-|-|
|is_url|matches URL strings.|

### Werkzeug Responses

|**Matcher**|**Function**|
|-|-|
|is_werkzeug_response|matches Werkzeug TestResponse.|
|redirects_to|matches if response redirects to URL.|
