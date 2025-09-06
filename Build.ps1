<#
	This file is part of Mizumiya.

	Mizumiya is free software: you can redistribute it and/or modify it under
	the terms of the GNU General Public License as published by the Free
	Software Foundation, either version 3 of the License, or (at your option)
	any later version.

	Mizumiya is distributed in the hope that it will be useful, but WITHOUT ANY
	WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
	FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
	details.

	You should have received a copy of the GNU General Public License along with
	Mizumiya. If not, see <https://www.gnu.org/licenses/>.
#>

$ModuleFile = "$PSScriptRoot/Mizumiya/Mizumiya.psm1"
$ManifestFile = "$PSScriptRoot/Mizumiya/Mizumiya.psd1"

(
	@"
# WARNING: This file was automaticaly generated! Do not manually modify this
# file. Your changes will be overwritten. Use Build.ps1 to regenerate this file.
"@,
	(cat ./common.ps1) + '',
	(./ElementGenerator.ps1) + '',
	(cat ./AddlFunctions.ps1 | tail -n '+18') # skip the license
) > $ModuleFile

$ExportedFunctions = grep -Po "(?<=Export-ModuleMember -Function ).+" $ModuleFile

Update-ModuleManifest `
	-Path $ManifestFile `
	-RootModule 'Mizumiya.psm1' `
	-ModuleVersion '0.2.0' `
	-Guid 'dc8f25a5-77ff-4610-be5a-9ac67eb600ea' `
	-Author helpimnotdrowning `
	-CompanyName helpimnotdrowning `
	-Copyright '(c) helpimnotdrowning. This software is licenced under the GNU General Public License, version 3 or later.' `
	-PowerShellVersion '7.5' `
	-FunctionsToExport $ExportedFunctions

sed -Ei "s# {4}| {3}#`t#g" $ManifestFile
