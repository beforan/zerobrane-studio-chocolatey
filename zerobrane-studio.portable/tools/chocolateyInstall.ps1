$name = 'zerobrane-studio.portable'
$url = 'https://download.zerobrane.com/ZeroBraneStudioEduPack-1.00-win32.zip'
$installPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage $name $url $installPath
