$url = 'https://www.nuget.org/api/v2/package/Selenium.WebDriver/3.141.0'
$d = ([System.Net.WebRequest]::CreateDefault($url)).GetResponse()
$g = $d.ResponseUri.OriginalString
$c = Split-Path -Path $d.ResponseUri.OriginalString -Leaf

Invoke-WebRequest -Uri $g -OutFile ~/Downloads/$c -UseBasicParsing -DisableKeepAlive

mkdir -p C:\Selenium
7z x $HOME/Downloads/$c -oC:\Selenium

$PathToFolder = 'C:\Selenium\lib\net45'
[System.Reflection.Assembly]::LoadFrom("{0}\WebDriver.dll" -f $PathToFolder)
if ($env:Path -notcontains ";$PathToFolder" ) {
    $env:Path += ";$PathToFolder"
}

# $ChromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
# $ChromeOptions.AcceptInsecureCertificates = $True

# $ChromeDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($ChromeOptions)
# $ChromeDriver.Url = 'https://www.tumblr.com/login'

# $ChromeDriver.FindElementByName('email').SendKeys('danijel.james@me.com')
# $ChromeDriver.FindElementByName('password').SendKeys('8Bx67Ap@x]zpJ')
# $ChromeDriver.FindElementByXPath('//*[@id="base-container"]/div[2]/div[2]/div[2]/div/section/div[2]/form/button').Click()

# $ChromeDriver.Url = 'https://www.tumblr.com/likes'
