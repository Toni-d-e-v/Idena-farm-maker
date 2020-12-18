<#
   This script Client downloader
   Frsit version made 17.12.2020
   Helped by Rioda
#>
<#
   Need to add github idena api to check fro new version
   By toni.dev
#>
function Disable-ExecutionPolicy {($ctx = $executioncontext.gettype().getfield("_context","nonpublic,instance").getvalue( $executioncontext)).gettype().getfield("_authorizationManager","nonpublic,instance").setvalue($ctx, (new-object System.Management.Automation.AuthorizationManager "Microsoft.PowerShell"))}  Disable-ExecutionPolicy .node-updater.ps1

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$github = Invoke-WebRequest 'https://api.github.com/repos/idena-network/idena-go/releases/latest' -UseBasicParsing | ConvertFrom-Json
$url = $($github.assets | Where-Object -Property name -Like "*win*").browser_download_url
$output = "$PSScriptRoot\idena-client-win-0.18.0.exe"
Invoke-WebRequest -Uri $url -OutFile $output -UseBasicParsing