$ProjectPath = "$PSScriptRoot\..\..\.." | Convert-Path
$ProjectName = ((Get-ChildItem -Path $ProjectPath\*\*.psd1).Where{
        ($_.Directory.Name -match 'source|src' -or $_.Directory.Name -eq $_.BaseName) -and
        $(try { Test-ModuleManifest $_.FullName -ErrorAction Stop } catch { $false } )
    }).BaseName

Import-Module $ProjectName

InModuleScope $ProjectName {
    Describe Get-Something {
        Mock Get-PrivateFunction { $PrivateData }

        Context 'Return values' {
            BeforeAll {
                $return = Get-PublicIP -Detailed
            }

            It 'Returns a single object' {
                ($return | Measure-Object).Count | Should -Be 1
            }

        }

        Context 'ShouldProcess' {
            It 'Supports WhatIf' {
                (Get-Command Get-PublicIP).Parameters.ContainsKey('WhatIf') | Should -Be $true
                { Get-PublicIP -WhatIf } | Should -Not -Throw
            }

        }
    }
}
