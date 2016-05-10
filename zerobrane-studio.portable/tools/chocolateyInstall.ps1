$name = 'zerobrane-studio.portable'
$url = 'https://download.zerobrane.com/ZeroBraneStudioEduPack-1.30-win32.zip'
$installPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage $name $url $installPath

# For some unknown reason, this Lua file is read-only by default
# which causes problems with uninstallation!
# So we'll do something about it.
attrib -r (join-path $installPath "myprograms/testwell.lua")
