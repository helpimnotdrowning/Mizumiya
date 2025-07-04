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


function Get-InnerHTML ($InnerHTML) {
	if ($null -ne $InnerHTML -and $InnerHTML.GetType() -eq [ScriptBlock]) {
		try {
			return $InnerHTML.Invoke()
		} catch {
			_info $_.Exception
			_info $_.ScriptStackTrace
			throw $_
		}
	} else {
		return "$InnerHTML"
	}
}

<#
.SYNOPSIS
	Take a hashtable of attributes and map them to their HTML representation,
	ignoring or transforming certain reserved keywords. All attributes are
	rendered to a single string and returned.

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
	* InnerHTML: this is handled in New-HTMLElement

.PARAMETER Attributes
	In most cases, this should be the $PSBoundParameters of the caller. No
	pre-filtering should be needed since it is done here, but for specific
	applications where you don't want to edit the module source code directly
	(like having extra switches or flags), doing so could be useful.
#>
function _fix_attributes {
	param (
		[Hashtable] $Attributes
	)
	
	# _map_attributes #
	
	if ($null -eq $Attributes -or $Attributes.Count -eq 0) {
		return ''
	}
	
	$FullAttrString = [System.Collections.Generic.List[String]]::new()
	
	:main foreach ($Attr in $Attributes.GetEnumerator()) {
		$Name = $Attr.Key
		if ($Name -eq 'InnerHTML') {
			continue
		}
		
		$Value = $Attr.Value.ToString()
		$Type = switch ($Name) {
			($_.GetType() -eq [Switch]) {
				# bug where manually specifying a switch like -Param:$False would still
				# render it, making it useless (the mere presence of HTML switches/
				# boolean attributes will activate them)
				if ($Value -eq 'True') {
					continue
				}
				
				'Switch'
			}
			default { 'String' }
		}
		
		switch ($Name) {
			'DownloadStr' {
				$Name = 'Download'
			}
			
			'_hs' {
				$Name = '_'
			}
			
			'Attributes' {
				foreach ($cattr in $Attr.Value.GetEnumerator()) {
					$FullAttrString.Add("$($cattr.Key)=""$([System.Web.HttpUtility]::HtmlAttributeEncode($cattr.Value))""")
				}
				
				continue main
			}
		}
		
		# _stringify_attributes #
		
		if ($Name -cmatch '^(Aria[A-Z]|HttpEquiv$|Hx[A-Z])') {
			$FixedName = $Name -replace "^.", { $_.Value.ToLower() } -creplace "[A-Z]",{ "-" + $_.Value.ToLower() }
		} else {
			$FixedName = $Name.ToLower()
		}
		
		switch ($Type) {
			'Switch' {
				$FullAttrString.Add( $FixedName )
			}
			
			'String' {
				$FullAttrString.Add( "$FixedName=""$Value""" )
			}
			
			# we control the type, no worries
			default { _warn "Invalid type for attribute $FixedName`: $_" }
		}
	}
	
	return $FullAttrString -join ' '
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
		[Hashtable] $Attributes,
		$InnerHTML
	)
	
	$HTML = [System.Collections.Generic.List[String]]::new()
	$HTML.Add("<$Tag")
	
	$HTML.Add((_fix_attributes $Attributes))
	
	if ($Void) {
		if ($InnerHTML) {
			_warn "Void element $($HTML -join ' ') /> cannot have an InnerHTML, ignoring."
		}
		
		$HTML.Add('/>')
	} else {
		$HTML.Add(">$(Get-InnerHTML $InnerHTML)</$Tag>")
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
	
	$Version = ('' -ne $Version ? "@$Version" : "")
	$FilePath = ('' -ne $FilePath ? "/$FilePath" : "")
	
	return script -Src "https://unpkg.com/$Package$Version$FilePath"
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
	
	return [System.Web.HttpUtility]::HtmlEncode( (Get-InnerHTML $Content) )
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
