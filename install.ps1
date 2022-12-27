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

$ChromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$ChromeOptions.AcceptInsecureCertificates = $True

$ChromeDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($ChromeOptions)
$ChromeDriver.Url = 'https://www.microsoft.com/download/details.aspx?id=101315'

$ChromeDriver.FindElementByXPath('//*[@id="ad36995f-7d06-75a1-2c27-34fdf96cc5d9"]/div/div/div[2]/div[3]/div/div/div/a').Click()


# single click
$ChromeDriver.FindElementByXPath('//*[@id="c3be6a19-ec3b-4b3b-c3f0-51317eccb8f8"]/div/div/div[2]/div[1]/div[2]/div/table/tbody/tr[1]/td[1]/input').Click()

$ChromeDriver.FindElementByXPath('//*[@id="c3be6a19-ec3b-4b3b-c3f0-51317eccb8f8"]/div/div/div[2]/div[1]/div[1]/div/div[1]/input').Click()
$ChromeDriver.FindElementByXPath('//*[@id="5b70c241-07ba-40b9-c0c1-6aae74ab472b"]').Click()
$a = 0
do {
    $b = (Get-ChildItem -Path $HOME\Downloads -Filter "*.part").Count
    Start-Sleep -Seconds 30
} until (
    $b -eq $a
)




$FirefoxOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$ChromeOptions.AcceptInsecureCertificates = $True

# $ChromeDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($ChromeOptions)
# $ChromeDriver.Url = 'https://www.tumblr.com/login'

# $ChromeDriver.FindElementByName('email').SendKeys('danijel.james@me.com')
# $ChromeDriver.FindElementByName('password').SendKeys('8Bx67Ap@x]zpJ')
# $ChromeDriver.FindElementByXPath('//*[@id="base-container"]/div[2]/div[2]/div[2]/div/section/div[2]/form/button').Click()

# $ChromeDriver.Url = 'https://www.tumblr.com/likes'