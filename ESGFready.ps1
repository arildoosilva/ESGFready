# This script will check if your operating system is ready to download and visualize data from ESGF
# Author: Arildo Oliveira Silva

cls;

Write-Host "This script will check if your system is ready to download and visualize data from ESGF`n" -foreground green;
Write-Host -NoNewline "Press any key to continue..." -foreground green;
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

cls;

Write-Host "Your system needs wget to download ESGF data, installing...`n`n" -foreground green;
Write-Host "Please accept the installation when prompted`n`n" -foreground green;

(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')))>$null 2>&1;

choco install wget;

cls;

Write-Host "Your system needs Java JDK to log in ESGF, please install it" -foreground green;
$answer = Read-Host "Do you want to install Java JDK? [y/n] ";
if ($answer -match "y") {
	Write-Host "Downloading Java JDK...`n" -foreground green;
	wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-windows-x64.exe" -P . -O jdk.exe;
	.\jdk.exe;
}else{
	Write-Host "The script won't install Java JDK" -foreground green;
}

Write-Host "`n`n`nYou can download grads at http://sourceforge.net/projects/opengrads/files/grads2/" -foreground green;