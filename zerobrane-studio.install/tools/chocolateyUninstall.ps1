$packageName = 'zerobrane-studio.install'
$zipFileName = 'zerobrane-studio.installInstall.zip'

try {
	UnInstall-ChocolateyZipPackage $packageName $zipFileName
	
	# Also remove the shortcut we added
	$shortcutPath = join-path $env:appdata "Microsoft\Windows\Start Menu\Programs"
	$shortcutName = "ZeroBrane Studio Lua IDE"
	$lnkPath = join-path $shortcutPath ($shortcutName + ".lnk")
	remove-item $lnkPath
} catch {
	throw $_.Exception
}