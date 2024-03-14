# Purpose: Install additional packages from Chocolatey.

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Installing additional Choco packages..."

If (-not (Test-Path "C:\ProgramData\chocolatey")) {
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Installing Chocolatey"
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Chocolatey is already installed."
}

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Installing Chocolatey extras..."
choco install -y --limit-output --no-progress wireshark
choco install -y --limit-output --no-progress autohotkey_l.portable

cd choco-winpcap
choco pack WinPcap.nuspec
choco install -y --limit-output --no-progress winpcap --source .

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Choco addons complete!"
