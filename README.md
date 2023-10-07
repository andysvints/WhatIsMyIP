# WhatIsMyIP
Module for geting Public IP of the computer.

## Install-Module

Copy and Paste the following command to install this package using PowerShellGet

```powershell
Install-Module -Name WhatIsMyIP 
```

## Cmdlets

Please refer to the comment-based help for more information about these commands.

### Get-PublicIP

This function is used to get External IP address using ipify.org and ipinfo.io APIs.

#### Syntax

```powershell
Get-PublicIP [-Detailed] [-WhatIf] [-Confirm] [<CommonParameters>]
```

#### Example

```powershell
  PS> whatismyip -detailed

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
``````

**[Icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/ip-address)**
