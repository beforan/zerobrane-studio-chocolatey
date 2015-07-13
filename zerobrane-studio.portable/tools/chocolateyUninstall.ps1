﻿$packageName = 'zerobrane-studio.portable'
$zipFileName = 'zerobrane-studio.portableInstall.zip'

# UnInstall-ChocolateyZipPackage doesn't work as expected in 0.9.9
# So we'll do it manually!
  
try {
	# $packagelibPath=$env:chocolateyPackageFolder
    # remove-item $packageLibPath -recurse
	
	UnInstall-ChocolateyZipPackage $packageName $zipFileName
} catch {
	throw $_.Exception
}