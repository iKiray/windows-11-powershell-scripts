# Windows Maintenance Scripts

A small collection of PowerShell scripts for keeping developer tools up to date on Windows. These are `.example.ps1` files meant to be copied/renamed (dropping `.example`) and customized before regular use.

## Scripts

### `run-all.example.ps1`
Runs every other `.ps1` script in this folder, one at a time.

- Skips itself (`run-all.ps1`) so it doesn't recurse.
- Sorts scripts alphabetically before running them.
- Wraps each script in a `try/catch` so one failing script doesn't stop the rest from running — failures are reported with `Write-Warning` instead of halting the batch.

Use this as the single entry point when you just want to "update everything."

### `update-ai-cli.example.ps1`
Updates AI coding CLI tools:

- Claude Code (`claude update`)
- Codex CLI (`codex update`)

Uses `$ErrorActionPreference = "Stop"` plus `$LASTEXITCODE` checks after each external command, so the script exits immediately if either update fails (external `.exe`-style tools don't throw terminating errors the way PowerShell cmdlets do, hence the manual exit-code check).

### `update-winget-packages.example.ps1`
Updates a fixed list of packages via `winget upgrade`:

- Git (`Git.Git`)
- Node.js (`OpenJS.NodeJS`)
- Python 3.13 (`Python.Python.3.13`)
- jq (`jqlang.jq`)

The package IDs live in a single `$packages` array at the top, so adding/removing a package only requires editing that list. Passes `--accept-source-agreements --accept-package-agreements` so `winget` runs non-interactively.

## Usage

1. Copy the desired script(s), removing `.example` from the filename (e.g. `update-winget-packages.example.ps1` → `update-winget-packages.ps1`).
2. Adjust package lists / tool names as needed.
3. Run individually, or run `run-all.ps1` to execute everything in the folder in one go.

```powershell
.\run-all.ps1
```
