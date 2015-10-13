<#

Currently Zerobrane provides a portable .zip
and an "installer" .exe which is really a self-extracting zip
that also adds a shortcut to the Start Menu.
It doesn't have a default "install" location, nor does it get listed
in Add/Remove Programs.

In order to prevent confusion (and allow for changes in future)
I have provided two packages which closely mimic the two options
for acquiring Zerobrane on Windows.

However, in the name of safety I use the .zip for both
(I don't know if Install-ChocolateyZipPackage works with .exes)

So the .install package only differs in that it adds a shortcut :)
#>

$name = 'zerobrane-studio.install'
$url = 'https://download.zerobrane.com/ZeroBraneStudioEduPack-1.20-win32.zip'
$installPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage $name $url $installPath

# For some unknown reason, this Lua file is read-only by default
# which causes problems with uninstallation!
# So we'll do something about it.
attrib -r (join-path $installPath "myprograms/testwell.lua")

# Place Start Menu Shortcut (mimicking Zerobrane's own self-extracting .exe)
$shortcutPath = join-path $env:appdata "Microsoft\Windows\Start Menu\Programs"
$shortcutName = "ZeroBrane Studio Lua IDE"
$lnkPath = join-path $shortcutPath ($shortcutName + ".lnk")
$targetPath = join-path $installPath "zbstudio.exe"

Install-ChocolateyShortcut -shortcutFilePath $lnkPath -targetPath $targetPath -description $shortcutName