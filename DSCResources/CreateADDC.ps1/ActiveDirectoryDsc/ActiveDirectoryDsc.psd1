@{
# Version number of this module.
moduleVersion = '5.0.0'

# ID used to uniquely identify this module
GUID = '9FECD4F6-8F02-4707-99B3-539E940E9FF5'

# Author of this module
Author = 'DSC Community'

# Company or vendor of this module
CompanyName = 'DSC Community'

# Copyright statement for this module
Copyright = 'Copyright the DSC Community contributors. All rights reserved.'

# Description of the functionality provided by this module
Description = 'The ActiveDirectoryDsc module contains DSC resources for deployment and configuration of Active Directory.

These DSC resources allow you to configure new domains, child domains, and high availability domain controllers, establish cross-domain trusts and manage users, groups and OUs.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0'

# Nested modules to load when this module is imported.
NestedModules = 'Modules\ActiveDirectoryDsc.Common\ActiveDirectoryDsc.Common.psm1'

# Functions to export from this module
FunctionsToExport = @(
  # Exported so that WaitForADDomain can use this function in a separate scope.
  'Find-DomainController'
)

# Cmdlets to export from this module
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module
AliasesToExport = @()

# Dsc Resources to export from this module
DscResourcesToExport = @(
    'ADComputer'
    'ADDomain'
    'ADDomainController'
    'ADDomainControllerProperties'
    'ADDomainDefaultPasswordPolicy'
    'ADDomainFunctionalLevel'
    'ADDomainTrust'
    'ADForestFunctionalLevel'
    'ADForestProperties'
    'ADGroup'
    'ADKDSKey'
    'ADManagedServiceAccount'
    'ADObjectEnabledState'
    'ADObjectPermissionEntry'
    'ADOptionalFeature'
    'ADOrganizationalUnit'
    'ADReplicationSite'
    'ADReplicationSiteLink'
    'ADServicePrincipalName'
    'ADUser'
    'WaitForADDomain'
)

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/dsccommunity/ActiveDirectoryDsc/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/dsccommunity/ActiveDirectoryDsc'

        # A URL to an icon representing this module.
        IconUri = 'https://dsccommunity.org/images/DSC_Logo_300p.png'

        # ReleaseNotes of this module
        ReleaseNotes = '# Change log for ActiveDirectoryDsc

The format is based on and uses the types of changes according to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

For older change log history see the [historic changelog](HISTORIC_CHANGELOG.md).

## [Unreleased]

### Added

- ADServicePrincipalName
  - Added Integration tests ([issue #358](https://github.com/PowerShell/ActiveDirectoryDsc/issues/358)).
- ADManagedServiceAccount
  - Added Integration tests.
- ADKDSKey
  - Added Integration tests ([issue #351](https://github.com/PowerShell/ActiveDirectoryDsc/issues/351)).

### Changed

- ADManagedServiceAccount
  - KerberosEncryptionType property added. ([issue #511](https://github.com/PowerShell/ActiveDirectoryDsc/issues/511)).
  - BREAKING CHANGE: AccountType parameter ValidateSet changed from (''Group'', ''Single'') to (''Group'', ''Standalone'') - Standalone is the correct terminology. Ref: [Service Accounts](https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/service-accounts).
  ([issue #515](https://github.com/PowerShell/ActiveDirectoryDsc/issues/515)).
  - BREAKING CHANGE: AccountType parameter default of Single removed. - Enforce positive choice of account type.
  - BREAKING CHANGE: MembershipAttribute parameter ValidateSet member SID changed to ObjectSid to match result property of Get-AdObject. Previous code does not work if SID is specified.
  - BREAKING CHANGE: AccountTypeForce parameter removed - unnecessary complication.
  - BREAKING CHANGE: Members parameter renamed to ManagedPasswordPrincipals - to closer match Get-AdServiceAccount result property PrincipalsAllowedToRetrieveManagedPassword. This is so that a DelegateToAccountPrincipals parameter can be added later.
  - Common Compare-ResourcePropertyState function used to replace function specific Compare-TargetResourceState and code refactored.
  ([issue #512](https://github.com/PowerShell/ActiveDirectoryDsc/issues/512)).
  - Resource unit tests refactored to use nested contexts and follow the logic of the module.
- ActiveDirectoryDsc
  - Updated PowerShell help files.
  - Updated Wiki link in README.md.
  - Remove verbose parameters from unit tests.
  - Fix PowerShell script file formatting and culture string alignment.
  - Add the `pipelineIndentationStyle` setting to the Visual Studio Code settings file.
  - Remove unused common function Test-DscParameterState ([issue #522](https://github.com/dsccommunity/ActiveDirectoryDsc/issues/522)).

### Fixed

- ActiveDirectoryDsc
  - Fix tests ErrorAction on DscResource.Test Import-Module.
- ADObjectPermissionEntry
  - Updated Assert-ADPSDrive with PSProvider Checks ([issue #527](https://github.com/PowerShell/ActiveDirectoryDsc/issues/527)).
- ADReplicationSite
  - Fixed incorrect evaluation of site configuration state when no description is defined ([issue #534](https://github.com/dsccommunity/ActiveDirectoryDsc/issues/534)).
- ADReplicationSiteLink
  - Fix RemovingSites verbose message ([issue #518](https://github.com/PowerShell/ActiveDirectoryDsc/issues/518)).
- ADComputer
  - Fixed the SamAcountName property description ([issue #529](https://github.com/dsccommunity/ActiveDirectoryDsc/issues/529)).

## 4.2.0.0

### Added

- ADReplicationSite
  - Added ''Description'' attribute parameter ([issue #500](https://github.com/PowerShell/ActiveDirectoryDsc/issues/500)).
  - Added Integration testing ([issue #355](https://github.com/PowerShell/ActiveDirectoryDsc/issues/355)).
- ADReplicationSubnet
  - Added ''Description'' attribute parameter ([issue #503](https://github.com/PowerShell/ActiveDirectoryDsc/issues/500)).
  - Added Integration testing ([issue #357](https://github.com/PowerShell/ActiveDirectoryDsc/issues/357)).
- ADReplicationSiteLink
  - Added Integration testing ([issue #356](https://github.com/PowerShell/ActiveDirectoryDsc/issues/356)).
  - Added ability to set ''Options'' such as Change Notification Replication ([issue #504](https://github.com/PowerShell/ActiveDirectoryDsc/issues/504)).

### Fixed

- ActiveDirectoryDsc
  - Resolved custom Script Analyzer rules that was added to the test framework.
- ActiveDirectoryDsc.Common
  - Fix `Test-DscPropertyState` Failing when Comparing $Null and Arrays. ([issue #513](https://github.com/PowerShell/ActiveDirectoryDsc/issues/513)).
- ADReplicationSite
  - Correct value returned for RenameDefaultFirstSiteName ([issue #502](https://github.com/PowerShell/ActiveDirectoryDsc/issues/502)).
'

        # Set to a prerelease string value if the release should be a prerelease.
        Prerelease = ''

      } # End of PSData hashtable

} # End of PrivateData hashtable
}





