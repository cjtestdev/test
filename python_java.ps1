# Check if folder and files were previously downloaded
$a = Get-ChildItem C:\python_java
if ($a.Count)
{
    "Files already Exist"
}
else
{
	#Create new folder for install files
    $fso = new-object -ComObject scripting.filesystemobject
	$fso.CreateFolder("C:\python_java")
}

Copy-Item batchfile.bat c:\python_java
cd C:\python_java

$storageDir = $pwd
$webclient = New-Object System.Net.WebClient
# Download Python 2.7.9
$url = "https://www.python.org/ftp/python/2.7.9/python-2.7.9.msi"
$file = "$storageDir\python-2.7.9.msi"
$webclient.DownloadFile($url,$file)
"$file Downloaded"
# Download Java 1.8
$url = "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jre-8u45-windows-x64.exe"
$file = "$storageDir\jre-8u45-windows-x64.exe"
$webclient.DownloadFile($url,$file)
"$file Downloaded"

"Installing ..."
cmd.exe /c '\python_java\batchfile.bat'