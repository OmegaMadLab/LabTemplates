Configuration CreateADDC
{

    param 
    ( 
         [Parameter(Mandatory)]
         [String]$DomainName,
 
         [Parameter(Mandatory)]
         [System.Management.Automation.PSCredential]$Admincreds,
 
         [Int]$RetryCount=20,
         [Int]$RetryIntervalSec=30
    ) 

    Import-DscResource -ModuleName PSDesiredStateConfiguration, ActiveDirectoryDsc

    [System.Management.Automation.PSCredential ]$DomainCreds = New-Object System.Management.Automation.PSCredential ("${DomainName}\$($Admincreds.UserName)", $Admincreds.Password)

    node 'localhost'
    {
        WindowsFeature 'ADDS'
        {
            Name   = 'AD-Domain-Services'
            Ensure = 'Present'
        }

        WindowsFeature 'RSAT'
        {
            Name   = 'RSAT-AD-PowerShell'
            Ensure = 'Present'
        }

        ADDomain 'LabDomain'
        {
            DomainName                    = $DomainName
            Credential                    = $DomainCreds
            SafemodeAdministratorPassword = $DomainCreds
            ForestMode                    = 'WinThreshold'
        }
    }
}
