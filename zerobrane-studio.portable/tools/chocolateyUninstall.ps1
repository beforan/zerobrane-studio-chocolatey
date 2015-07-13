$packageName = 'zerobrane-studio.portable'
$zipFileName = 'zerobrane-studio.portableInstall.zip'
  
try {
	UnInstall-ChocolateyZipPackage $packageName $zipFileName
} catch {
	throw $_.Exception
}