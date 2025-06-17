<#
	This file is part of Mizumiya.

	Mizumiya is free software: you can redistribute it and/or modify it under the
	terms of the GNU General Public License as published by the Free Software
	Foundation, either version 3 of the License, or (at your option) any later
	version.

	Mizumiya is distributed in the hope that it will be useful, but WITHOUT ANY
	WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
	FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
	details.

	You should have received a copy of the GNU General Public License along with
	Mizumiya. If not, see <https://www.gnu.org/licenses/>.
#>

# Probably a general purpose preprocessor. I needed a way to retrieve the
# attributes of a generated element function and use it in another, so I decided
# to write a preprocessor that will extract that for me (rather than a
# potentially more efficient or intelligent solution). This step may be thrown
# out in the future (though it will of course be uploaded elsewhere!)

# This file is a product of sleep-deprived programming.

. ./common.ps1

class Def {
	[String] $Name;
	[Collections.Generic.List[String]] $Content = @();
	[int] $LineBegin;
	[bool] $Open;
	
	# multi-line constructor
	Def([String] $Name, [int] $LineBegin) {
		$this.Name = $Name
		$this.LineBegin = $LineBegin
		$this.Open = $True
	}
	
	# single-line constructor
	Def([String] $Name, [int] $LineBegin, [String] $Content) {
		$this.Name = $Name
		$this.LineBegin = $LineBegin
		$this.Content.Add($Content)
		$this.Open = $False;
	}
	
	[void] AddLine([String] $Line) {
		if (-not $this.Open) {
			_fatal "Tried to modify closed Def $($this.Name)"
		}
		
		$this.Content.Add($Line)
	}
	
	[void] Close() {
		$this.Open = $False
	}
	
	[String] Build() {
		if ($this.Open) {
			_fatal "Tried to build open Def $($this.Name)"
		}
		
		return $this.Content -join "`n"
	}
}

<#
.DESCRIPTION
	The following directives are defined:

	# &IMPORT <file path>
		Include the full text of the referenced file. You can prepend the path
		with another "&" to reference a macro.

	# &CIMPORT <file path>
		Get only the macro definitions from the referenced file.

	# &DEFINE <name> <definition>
		Define a single-line named macro.

	# &DEFBEGIN <name>
		Begin a multi-line named macro definition. Theoreically supports nested
		definitions, but this is not tested.

	# &DEFEND <name>
		End a multi-line named macro definition.

	< # &USE <name> # > (not implemented)
	# &USE <name>
		Replace the line or statement with the named macro.

	# &OUSE <name>
		Optional use; if the macro doesn't exist, it will be ignored

	There is no protection against loops--or much of anything, really. Please
	don't do that.

.PARAMETER SourceFile
	Input file

.PARAMETER OutputFile
	Output (processed) file. If this is blank ("") or "-", the processed output
	is returned.

.PARAMETER GetDict
	When passed, this function returns the internal Defs dictionary (type
	[System.Collections.Specialized.OrderedDictionary]) containing a file's
	macro definitions instead of the processed output. OutputFile is ignored.

.PARAMETER Variables
	Macros can be pre-declared in a format similar to an env file (name=value)
	as an array of strings. The value is only split along the first equals
	sign, so feel free to have some more after that.
#>
function Preprocessor {
	param (
		[Parameter(Mandatory)]
		[String] $SourceFile,
		[String] $OutputFile,
		[Switch] $GetDict,
		[String[]] $Variables
	)
	
	$ErrorActionPreference = 'Stop'
	
	$Defs = [System.Collections.Specialized.OrderedDictionary]::new()
	$LineNo = 0
	
	if ($Variables) {
		$Variables | % {
			if ($_ -notlike "*=*") {
				_fatal "Malformed macro definition $_"
			}
			
			$Name,$Value = $_ -split '=',2 # only split on 1st = sign
			
			$Defs[$Name] = [Def]::new($Name, -1, $Value)
		}
	}
	
	$File = [Collections.Generic.List[String]] (cat $SourceFile)
	$Output = [Collections.Generic.List[String]]@()
	
	$LineNo = 0
	# no for loop since $File may grow while the loop runs
	while (1) {
		$LineNo++
		$Line = $File[$LineNo - 1]
		
		switch -Regex -CaseSensitive ($Line) {
			"^# &IMPORT (\S+)" {
				$FileName = $Matches[1]
				
				if ($FileName.StartsWith('&')) {
					$Name = $FileName.Substring(1) # strip &
					if (-not $Defs.Contains($Name)) {
						_fatal "Tried to use nonexistant macro $Name at line $LineNo"
					}
					
					$FileName = $Defs[$Name].Build()
				}
				
				if (-not (Test-Path -Type Leaf -LiteralPath $FileName)) {
					_fatal "Nonexistant file $FileName passed to &IMPORT at line $LineNo"
				}
				
				$File.InsertRange($LineNo+1, [Collections.Generic.List[String]](cat $FileName))
			}
			
			"^# &CIMPORT (\S+)" {
				$FileName = $Matches[1]
				
				if ($FileName.StartsWith('&')) {
					$Name = $FileName.Substring(1)
					if (-not $Defs.Contains($Name)) {
						_fatal "Tried to use nonexistant macro $Name at line $LineNo"
					}
					
					$FileName = $Defs[$Name].Build()
				}
				
				if (-not (Test-Path -Type Leaf -LiteralPath $FileName)) {
					_fatal "Nonexistant file $FileName passed to &IMPORT at line $LineNo"
				}
				
				$ImportedDefs = Preprocessor -SourceFile $FileName -GetDict
				$Defs += $ImportedDefs
			}
			
			"^# &DEFINE (\S+) (.+)" {
				$Name = $Matches[1]
				$Defs[$Name] = [Def]::new($Name, $LineNo, $Matches[2])
			}
			
			"^# &DEFBEGIN (\S+)" {
				$Name = $Matches[1]
				
				if ($Defs[$Name].Open) {
					_fatal "&DEFBEGIN $Name already exists from line $($Defs.LineBegin) at line $LineNo"
				}
				
				$Defs[$Name] = [Def]::new($Name, $LineNo)
			}
			
			"^# &DEFEND (\S+)" {
				$Name = $Matches[1]
				
				if (-not $Defs[$Name].Open) {
					_fatal "Unopened &DEFEND $Name at line $LineNo"
				}
				
				$Defs[$Name].Open = $False
			}
			
			"^# &USE (\S+)" {
				$Name = $Matches[1]
				
				if ($null -eq $Defs[$Name]) {
					_fatal "Tried to use nonexistant macro $Name at line $LineNo"
				}
				
				if ($Defs[$Name].Open) {
					_fatal "Tried to use unclosed macro $Name at line $LineNo"
				}
				
				$Output.AddRange($Defs[$Name].Content)
			}
			
			"^# &OUSE (\S+)" {
				$Name = $Matches[1]
				
				if ($null -eq $Defs[$Name]) {
					return
				}
				
				if ($Defs[$Name].Open) {
					_fatal "Tried to use unclosed macro $Name at line $LineNo"
				}
				
				$Output.AddRange($Defs[$Name].Content)
			}
			
			"^# &" {
				# if any of the valid directive cases throw an error, it falls
				# through to here
				if ($_ -notmatch "^# &(O?USE|C?IMPORT|DEF(BEGIN|END)?) (\S+)") {
					_fatal "Unrecognized directive $_ at line $LineNo"
				}
			}
			
			default {
				if ($Defs[-1].Open) {
					$Defs[-1].Content.Add($Line)
				}
				
				$Output.Add($Line)
			}
		}
		
		if ($LineNo -ge $File.count) {
			break
		}
	}

	if ($Defs.Open) {
		_fatal "Unclosed &DEFBEGIN from line $($Defs.LineBegin)"
	}

	if ($GetDict) {
		return $Defs
	}

	$Out = $Output -join "`n"
	if ($OutputFile -in @('', '-')) {
		return $Out
	} else {
		$Out > $OutputFile
	}
}
