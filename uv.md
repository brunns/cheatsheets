# uv cheatsheet

## Creating projects

|**Command**|**Function**|
|-|-|
|`uv init`|initialise a project in the current directory||
|`uv init foo`|initialise project foo (in the directory foo/)||
|`uv init --app --package ...`|initialise an application||
|`uv init --lib --package ...`|initialise a library ||
|`uv init --python 3.X`||

## Installing Python

|**Command**|**Function**|
|-|-|
|`uv python install 3.{14..11}`||
|`uv python install 3.15 --default`||
|`uv python pin --global 3.15`||
|`uv python update-shell`||
|`uv run python --version`||

## Running

|**Command**|**Function**|
|-|-|
|`uv run --python 3.14 --with "marimo,httpx2,yarl,pandas,polars,numpy,scipy,sympy,matplotlib,metpy,pint,networkx,pydantic,python-dateutil,dotenv,ruff,pytest,altair,duckdb,sqlglot,watchdog" marimo edit --watch marimo_notebook.py`||
|`uv run cli -vvv --max-connections 16`||
|`uv run lint-imports --help`||
|`uv run lint-imports --no-logo --show-timings`||
|`uv run lint-imports -h`||
|`uv run ruff check . --fix-only --unsafe-fixes`||

## Managing dependencies

### Adding 

|**Command**|**Function**|
|-|-|
|`uv add "flask[async]" gunicorn "httpx2[http2]"`||
|`uv add --dev pytest pyhamcrest`||

### Viewing 

|**Command**|**Function**|
|-|-|
|`uv tree`||

### Updating 

|**Command**|**Function**|
|-|-|
|`uv tree --outdated`||
|`uv sync --upgrade`||
|`uv lock --upgrade-package werkzeug`||

## Bumpling dependency versions

|**Command**|**Function**|
|-|-|
|`uv version --bump major\|minor\|patch`||
|`version=$(uv version --short)`||

## Running tools

|**Command**|**Function**|
|-|-|
|`uvx ...`|Shortcut for `uv tool run ...`|
|`uvx dddlint lint`||
|`uvx --from nasa-lsp nasa lint`||
|`uvx ruff@latest check .`||
|`uvx ruff format wet-bulb.py && uvx ruff check wet-bulb.py --fix-only`||
