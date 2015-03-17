$packageName = 'zerobrane-studio.install'
$zipFileName = 'zerobrane-studio.installInstall.zip'

# UnInstall-ChocolateyZipPackage doesn't work as expected in 0.9.9
# So we'll do it manually!

# UnInstall-ChocolateyZipPackage $packageName $zipFileName
  
try {
	$packagelibPath=$env:chocolateyPackageFolder
    remove-item $packageLibPath -recurse
	
	# Also remove the shortcut we added
	$shortcutPath = join-path $env:appdata "Microsoft\Windows\Start Menu\Programs"
	$shortcutName = "ZeroBrane Studio Lua IDE"
	$lnkPath = join-path $shortcutPath ($shortcutName + ".lnk")
	remove-item $lnkPath
} catch {
	throw $_.Exception
}