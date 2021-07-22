$command = Read-Host("Enter a command")

if ($command -eq "on"){
    Write-Host "Light On" -BackgroundColor Yellow -ForegroundColor Black
}
else {
    Write-Host "Light Off" -BackgroundColor Gray -ForegroundColor White
}