#this script is for updating my AI CLI tools
$ErrorActionPreference = "Stop" #for any powershell error(s), use once at top level generally.

Write-Host "Running script..." #powershell message

#claude code
Write-Host "Updating Claude Code..."
claude update
if ($LASTEXITCODE -ne 0) {
    Write-Host "Claude Code update failed."
    exit $LASTEXITCODE
}
#anything not equal to 0 in exit code means it's an error, and will exit
# -ne 0 = not equal to 0

#codex cli
Write-Host "Updating Codex CLI"
codex update
if ($LASTEXITCODE -ne 0) {
    Write-Host "Codex update failed."
    exit $LASTEXITCODE
}

Write-Host "Script Finished."

# $LASTEXITCODE for external programs generally.
# the try/catch method otherwise for powershell cmdlets/native commands.