
<#
.Synopsis
   Get External IP address
.DESCRIPTION
   Get External IP address using free ipfy.org API.
.EXAMPLE
   PS C:\> Get-PublicIP
0.0.0.1
.EXAMPLE
   PS C:\> whatismyip
0.0.0.2
#>
function Get-PublicIP
{
    [CmdletBinding(SupportsShouldProcess=$true,
                  PositionalBinding=$false,
                  ConfirmImpact='Medium')]
    [Alias('whatismyip','Get-ExternalIP')]
    Param
    (

    )

    Begin
    {
    }
    Process
    {
        if ($pscmdlet.ShouldProcess("computer"))
        {
                $IPObj = Invoke-RestMethod -Uri 'https://api.ipify.org?format=json'
                $IPObj.IP

        }
    }
    End
    {
    }
}
