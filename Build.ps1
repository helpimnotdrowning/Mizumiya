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

. ./Preprocessor.ps1

$ModuleFile = "$PSScriptRoot/Mizumiya/Mizumiya.psm1"
$ManifestFile = "$PSScriptRoot/Mizumiya/Mizumiya.psd1"

$GeneratedFile = New-TemporaryFile

./ElementGenerator.ps1 >> $GeneratedFile
(
"# WARNING: This file was automaticaly generated on $(Get-Date -AsUTC -Format o)",
"# Do not manually modify this file. Your changes will be overwritten.",
(Preprocessor -SourceFile "AddlFunctions.ps1" `
		-Variables "ELEMENTS=$GeneratedFile","COMMON=./common.ps1" `
		-OutputFile -)
) > $ModuleFile

rm $GeneratedFile

$ExportedFunctions = grep -Po "(?<=EXPORTFUNC ).+" $ModuleFile

Update-ModuleManifest -Path $ManifestFile -FunctionsToExport $ExportedFunctions
