Install-Module pspki -Scope CurrentUser

$cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature `
-Subject "CN=P2SRoot" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign -KeyUsage CertSign

$mychildcert = New-SelfSignedCertificate -Type Custom -DnsName P2SChildCert -KeySpec Signature ` -Subject "CN=P2SChildCert" -KeyExportPolicy Exportable ` -HashAlgorithm sha256 -KeyLength 2048 ` -CertStoreLocation "Cert:\CurrentUser\My" ` -Signer $cert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")

#Output New Public Key
[System.Convert]::ToBase64String($(get-item -path "Cert:\CurrentUser\My\$($mychildcert.thumbprint)").RawData)