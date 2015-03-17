$packageName = 'zerobrane-studio.portable'
$zipFileName = 'zerobrane-studio.portableInstall.zip'


# For some unknown reason, this Lua file is read-only by default
# which really screws with uninstallation!
# So we'll do something about it, if it's still there
$testwell = (join-path $installPath "myprograms/testwell.lua")
if (test-path $testwell) {
	attrib -r $testwell
}


# UnInstall-ChocolateyZipPackage doesn't seem to work as expected in 0.9.9
# So we'll do it manually!

# UnInstall-ChocolateyZipPackage $packageName $zipFileName
 
try {
	$packagelibPath=$env:chocolateyPackageFolder
    remove-item $packageLibPath -recurse
} catch {
	throw $_.Exception
}