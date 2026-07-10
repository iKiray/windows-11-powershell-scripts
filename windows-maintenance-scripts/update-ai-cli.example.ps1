$ErrorActionPreference = "Stop"

Write-Host "=== Running script..."
Write-Host ""

Write-Host "Updating OpenCode..."
npm i -g opencode-ai
if ($LASTEXITCODE -ne 0) {
    Write-Host "OpenCode update failed."
    exit $LASTEXITCODE
}

Write-Host "Updating Claude Code..."
claude update
if ($LASTEXITCODE -ne 0) {
    Write-Host "Claude Code update failed."
    exit $LASTEXITCODE
}

Write-Host ""

Write-Host "Updating Codex CLI..."
codex update
if ($LASTEXITCODE -ne 0) {
    Write-Host "Codex update failed."
    exit $LASTEXITCODE
}

Write-Host ""

Write-Host "Script finished. ==="