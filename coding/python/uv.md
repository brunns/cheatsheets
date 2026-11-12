# uv cheatsheet

## Creating projects

|**Command**|**Function**|
|-|-|
|`uv init`|initialise a project in the current directory|
|`uv init foo`|initialise project foo (in the directory foo/)|
|`uv init --app --package ...`|initialise an application packaged as an installable package|
|`uv init --lib --package ...`|initialise a library packaged as an installable package|
|`uv init --python 3.X`|initialise a project targeting a specific Python version (writes `.python-version`)|

## Installing Python

|**Command**|**Function**|
|-|-|
|`uv python list`|List available and locally installed Python versions|
|`uv python install 3.{14..11}`|install multiple Python versions (3.11 through 3.14) using shell expansion|
|`uv python install 3.15 --default`|download and install Python 3.15 and set it as the default Python version|
|`uv python pin 3.12`|Pin Python 3.12 for the current directory by writing to `.python-version`|
|`uv python pin --global 3.15`|pin Python 3.15 globally as the fallback version across all directories|
|`uv python update-shell`|add uv-installed Python executables to your shell configuration (`PATH`)|
|`uv run python --version`|display the Python version resolved and used in the current environment|
|`uv python find`|Print the path to the active Python executable|

## Running

|**Command**|**Function**|
|-|-|
|`uv run cli -vvv --max-connections 16`|execute a project CLI command or script with verbose output and connection flags|
|`uv run lint-imports --help`|show help and usage information for `lint-imports` in the project environment|
|`uv run lint-imports --no-logo --show-timings`|run `lint-imports` suppressing the startup banner and printing timing benchmarks|
|`uv run ruff check . --fix-only --unsafe-fixes`|run Ruff to automatically apply all lint fixes (including unsafe fixes) without listing remaining errors|

## Managing dependencies

### Adding 

|**Command**|**Function**|
|-|-|
|`uv add "flask[async]" gunicorn "httpx2[http2]"`|add multiple dependencies with specified optional extras to `pyproject.toml`|
|`uv add --dev pytest pyhamcrest`|add packages to the development dependency group (`[tool.uv.dev-dependencies]` / `[dependency-groups]`)|

### Viewing 

|**Command**|**Function**|
|-|-|
|`uv tree`|render the resolved dependency tree for the project|

### Updating 

|**Command**|**Function**|
|-|-|
|`uv tree --outdated`|render the dependency tree highlighting dependencies that have newer releases|
|`uv sync --upgrade`|update all project dependencies to their latest compatible versions and sync the virtualenv|
|`uv lock --upgrade-package werkzeug`|re-resolve the lockfile updating specifically `werkzeug` (and its dependencies) to the latest version|

### Removing

|**Command**|**Function**|
|-|-|
|`uv remove <pkg>`|Remove a package from project dependencies|
|`uv remove --dev <pkg>`|Remove a package from development dependency group|

## Bumping versions

|**Command**|**Function**|
|-|-|
|`uv version --bump major\|minor\|patch`|bump the project package version by major, minor, or patch release in `pyproject.toml`|
|`version=$(uv version --short)`|extract and store the current bare project version number in a shell variable|

## Running tools

### Ephemeral

|**Command**|**Function**|
|-|-|
|`uvx ...`|Shortcut for `uv tool run ...`|
|`uvx dddlint lint`|download, cache, and execute `dddlint` in an isolated ephemeral environment|
|`uvx --from nasa-lsp nasa lint`|run the `nasa` binary installed specifically from the `nasa-lsp` distribution package|
|`uvx ruff@latest check .`|force downloading and running the latest available release of Ruff|
|`uvx ruff format wet-bulb.py && uvx ruff check wet-bulb.py --fix-only`|format a file with Ruff and immediately apply any auto-fixable lint issues|

### Persistent

|**Command**|**Function**|
|-|-|
|`uv tool install <tool>`|Install a persistent CLI tool into its own isolated environment (e.g., uv tool install ruff)|
|`uv tool list`|List all globally installed CLI tools and their executables|
|`uv tool upgrade --all`|Upgrade all globally installed tools to their latest releases|
|`uv tool uninstall <tool>`|Remove an installed tool environment|

## Scripts (PEP 723)

|**Command**|**Function**|
|-|-|
|`uv run script.py`|Run a standalone script, automatically provisioning inline metadata dependencies|
|`uv add --script script.py httpx2`|Add inline dependency metadata (PEP 723) directly to a standalone script|
|`uv init --script script.py`|Initialize a standalone script with inline metadata header|

Shebang to make standalone script with PEP 723 inline metadata runnable:

```sh
#!/usr/bin/env -S uv run
```

## Cache management

|**Command**|**Function**|
|-|-|
|`uv cache clean`|Remove all cached wheels and downloaded source archives|
|`uv cache prune`|Remove unused or outdated cache entries to free disk space|

## Misc

|**Command**|**Function**|
|-|-|
|`uv export --no-dev --no-emit-project --prune boto3 --python 3.14 --format requirements-txt --output-file requirements.txt`|Export dependency (only) list as a `requirements.txt` file, omitting `boto3`.|
|`uv pip install -r requirements.txt --no-deps --target build --python 3.14`|Install dependencies from `requirements.txt` into `build/` directory.|

Run Marimo editor on Python 3.14 with ad-hoc ephemeral dependencies without modifying `pyproject.toml`

```sh
uv run --python 3.14 --with "marimo,httpx2,yarl,pandas,polars,numpy,scipy,sympy,matplotlib,metpy,pint,networkx,pydantic,python-dateutil,dotenv,ruff,pytest,altair,duckdb,sqlglot,watchdog" marimo edit --watch marimo_notebook.py
```
