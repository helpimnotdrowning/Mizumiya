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

# &IMPORT &COMMON

# &IMPORT &ELEMENTS

class TypeAndValue {
	[ValidateSet("Switch", 'String', 'OptionalString')][String] $Type
	[String] $Value
}

function _pascal_to_kebab ($str) {
	# lowercase 1st character, then kebab+lowercase only the next capital letter
	return $Str -replace "^.",{ $_.Value.ToLower() } -creplace "[A-Z]",{ "-" + $_.Value.ToLower() }
}

function Get-InnerHTML ($InnerHTML) {
	if ($null -ne $InnerHTML -and $InnerHTML.GetType() -eq [ScriptBlock]) {
		return $InnerHTML.Invoke()
	} else {
		return "$InnerHTML"
	}
}

function _map_untyped_attributes {
	param ( [Hashtable] $Attributes )
	
	$Dict = [Collections.Generic.Dictionary[[String],[TypeAndValue]]]::new()
	
	$Attributes.Keys | % {
		$Name = $_
		$Value = "$($Attributes[$Name])"
		
		$Dict.Add( $Name, [TypeAndValue]@{ Type="String"; Value=$Value } )
	}
	return $Dict
}

<#
.SYNOPSIS
	Remap attribute names from their PowerShell representation to their proper
	HTML representation.

.DESCRIPTION
	Attributes are remapped from their PowerShell parameter representation
	(PascalCase) to their proper HTML representation (lowercase). Some
	attributes (notably, the aria-* and hx-* set) are partially in kebab-case or
	otherwise specially-handled:
	* Aria*: the accessability attribute set. See [ARIA - Glossary of web terms | MDN](https://developer.mozilla.org/docs/Glossary/ARIA)
	* HttpEquiv: for some reason, this attribute has a hyphen.
	* Hx*: the HTMX attribute set. See [</> htmx ~ Reference](https://htmx.org/reference/)
	* _hs: better name for the _hyperscript "_" attribute.
	* Download/DownloadStr: use `-Download` for normal operation, use
	`-DownloadStr` to name the file.
	* InnerHTML: discarded; this is handled elsewhere.
#>
function _map_attributes {
	param ( [Hashtable] $Attributes )
	
	$Dict = [Collections.Generic.Dictionary[[String],[TypeAndValue]]]::new()
	$Attributes.Keys | % {
		
		$Name = $_
		$Value = $Attributes[$Name].ToString()
		$Type = switch ($Attributes[$Name].GetType()) {
			[Switch] { 'Switch' }
			default { 'String' }
		}
		
		
		switch ($Name) {
			'DownloadStr' {
				$Name = 'Download'
			}
			
			'_hs' {
				$Name = '_'
			}
			
			# Custom attributes
			'Attributes' {
				# this specifically circumvents the requirements of "real"
				# parameters
				$CustomAttrs = $Attributes[$Name]
				
				$CustomAttrs.Keys | % {
					$Dict.Add($_, [TypeAndValue]@{
						Type='String'
						Value=$CustomAttrs[$_]
					})
				}
				
				return
			}
			
			'InnerHTML' { return }
		}
		
		$Dict.Add($Name, [TypeAndValue]@{
			Type=$Type
			Value=$Value
		})
	}
	
	return $Dict
}

<#
.SYNOPSIS
	Create an arbitrary HTML element. Consider using the
	`New-HTMLELementFunction` generator or the `_new_tag` helper instead.

.DESCRIPTION
	Create an arbitrary HTML element. The calling convention for this function
	is a bit painful (specifically the Attributes paraneter); you should
	probably use the `New-HTMLElementFunction` generator (and its internal
	helper `_new_tag`) to more easily create new elements.

.PARAMETER Tag
	HTML element tag name. Cannot be blank, for obvious reasons.

.PARAMETER Void
	Marks this element as a self-closing "void" paramater. This means that the
	element will be written as `<div />` instead of `<div></div>. Void elements
	cannot have an InnerHTML.
	
	See [Void element - Glossary of web terms | MDN](https://developer.mozilla.org/en-US/docs/Glossary/Void_element) for more
	information.

.PARAMETER Attributes
	List of tag attributes.
	
	Attributes are remapped from their PowerShell parameter representation
	(PascalCase) to their proper HTML representation (lowercase). Some
	attributes (notably, the aria-* set) are partially in kebab-case. These are
	specially handled to correct them:
	* Aria*: the accessability attribute set. See [ARIA - Glossary of web terms | MDN](https://developer.mozilla.org/en-US/docs/Glossary/ARIA)
	* HttpEquiv: for some reason, this attribute has a hyphen.
	* Hx*: the HTMX attribute set. See [</> htmx ~ Reference](https://htmx.org/reference/)

.PARAMETER InnerHTML
	If this parameter is a [ScriptBlock], then it will be Invoke()ed and its
	output will be inserted.
	
	Otherwise, it will just be inserted.
	
	When this parameter is passes alongside `-Void`, this parameter is ignored.
#>
# EXPORTFUNC New-HTMLElement
function New-HTMLElement {
	param(
		[Parameter(Mandatory)]
		[ValidateNotNullOrWhiteSpace()]
		[String] $Tag,
		[Switch] $Void,
		[Collections.Generic.Dictionary[[String], [TypeAndValue]]] $Attributes,
		$InnerHTML
	)
	
	$HTML = [System.Collections.Generic.List[String]]::new()
	$HTML.Add("<$Tag")
	
	if ($null -ne $Attributes -and $Attributes.Count -ne 0) {
		$Attributes.Keys | % {
			$AtName = $_
			
			if ($AtName -cmatch '^(Aria[A-Z]|HttpEquiv$|Hx[A-Z])') {
				$FixedName = _pascal_to_kebab $AtName
			} else {
				$FixedName = $AtName.ToLower()
			}
			
			switch ($Attributes[$AtName].Type) {
				'Switch' {
					$HTML.Add( $FixedName )
				}
				
				{ $_ -in @('String', 'OptionalString') } {
					$HTML.Add( "$FixedName=`"$($Attributes[$AtName].Value)`"" )
				}
				
				default { _warn "Invalid type for attribute $FixedName`: $_" }
			}
		}
	}

	if ($Void) {
		if ($InnerHTML) {
			_warn "Void element $($HTML -join ' ') /> cannot have an InnerHTML, ignoring."
		}
		
		$HTML.Add('/>')
		
	} else {
		$Content = Get-InnerHTML $InnerHTML
		$HTML.Add(">$Content</$Tag>")
	}
	
	return $HTML -join ' '
}

# EXPORTFUNC Import-NPMScript
function Import-NPMScript {
	param (
# &USE script/param

		[Parameter(Mandatory)]
		[String] $Package,
		[String] $Version,
		[String] $FilePath
	)
	
	$VersionString = ('' -ne $Version ? "@$Version" : "")
	$FilePathString = ('' -ne $Version ? "/$FilePath" : "")
	
	return script -Src "https://unpkg.com/$Package$VersionString$FilePathString"
}

<#
.SYNOPSIS
	HTML encode argument

.PARAMETER Content
	If Content is a scriptblock, it will be Invoke()ed
	and its output will then be encoded.
	
	Otherwise, it will just be encoded.
#>
# EXPORTFUNC HTMLEncode
function HTMLEncode {
	param (
		$Content
	)
	
	if ($null -ne $Content -and $Content.GetType() -eq [ScriptBlock]) {
		return [System.Web.HttpUtility]::HtmlEncode($Content.Invoke())
	} else {
		return [System.Web.HttpUtility]::HtmlEncode("$Content")
	}
}

<#
.SYNOPSIS
	Write HTML doctype declaration. This should be the first thing in your HTML
	document
#>
# EXPORTFUNC doctype
function doctype {
	return "<!DOCTYPE html>"
}

<#
.SYNOPSIS
	Write an HTML comment
#>
# EXPORTFUNC comment
function comment {
	param (
		$InnerHTML
	)
	
	return "<!-- $( Get-InnerHTML $InnerHTML ) -->"
}
