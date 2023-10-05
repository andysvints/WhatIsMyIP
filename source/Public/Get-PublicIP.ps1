function Get-PublicIP
{
    <#
        .Synopsis
        Get External IP address
        .DESCRIPTION
        Get External IP address using free ipfy.org API.
        .EXAMPLE
        PS C:\> Get-PublicIP
        0.0.0.1
        .EXAMPLE
        PS C:\> whatismyip -detailed
        ip       : 1.1.1.1
        hostname : one.one.one.one
        anycast  : True
        city     : Los Angeles
        region   : California
        country  : US
        loc      : 34.0522,-118.2437
        org      : AS13335 Cloudflare, Inc.
        postal   : 90076
        timezone : America/Los_Angeles
    #>
    [CmdletBinding(SupportsShouldProcess=$true,
                  PositionalBinding=$false,
                  ConfirmImpact='Medium')]
    [Alias('whatismyip','Get-ExternalIP')]
    Param
    (
        [switch]$Detailed
    )

    process
    {
        if ($pscmdlet.ShouldProcess("computer"))
        {
            try {
                $IPObj = Invoke-RestMethod -Uri 'https://api.ipify.org?format=json'

                if ($Detailed)
                {
                    $DetailedObj=Invoke-RestMethod -Uri "https://ipinfo.io/$($IPObj.IP)/json"
                    $DetailedObj | Select-Object -ExcludeProperty readme
                }else{
                    $IPObj.IP
                }
            }
            catch {
                Write-Verbose "Something bad happened. Please review exception message for more details"
                Write-Error ("Catched Exception: - $($_.exception.message)")
            }

        }

    }
}
