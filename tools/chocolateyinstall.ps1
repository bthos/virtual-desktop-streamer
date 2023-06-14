
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.vrdesktop.net/files/VirtualDesktop.Streamer.Setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Virtual Desktop Streamer*'

  checksum      = 'E5EB0B067F6C6450038500584A0C1E2F506BB3D4FFE4B08877F3A608B4B753FB'
  checksumType  = 'sha256'
  checksum64    = 'E5EB0B067F6C6450038500584A0C1E2F506BB3D4FFE4B08877F3A608B4B753FB'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
