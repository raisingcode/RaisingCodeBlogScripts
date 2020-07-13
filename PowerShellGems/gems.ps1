import-module jwt

#GH App ID
$app_id = "70926" 
#read github app pem save it as pfx
[string]$pem_file = "gh_app.pfx" 
[byte[]] $data = Get-Content $pem_file -Encoding byte


[string]$file_pem = "$(Get-Location)\$($pem_file)"

$cert =  New-Object System.Security.Cryptography.X509Certificates.X509Certificate2('c:\Users\phill\Github\RaisingCodeBlogScripts\PowerShellGems\gh_app.pfx)

<# 
#create the json payload
$issued_date =  [math]::Round((New-Object System.TimeSpan((Get-Date).Ticks)).TotalSeconds)
$exp_date = [math]::Round((New-Object System.TimeSpan((Get-Date).AddSeconds(60*10).Ticks)).TotalSeconds)





$json_payload = '{"iat":"$(issued_date)","exp":"$(exp_date)","iss":"$(app_id)"}'


New-JWT -Cert $cert -PayloadJson $json_payload

#>