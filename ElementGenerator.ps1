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

. ./common.ps1

#region Starting functions

class TypeValidateSet {
	# TODO: SwitchOrString/OptionalString
	[ValidateSet("Switch", 'String', 'OptionalString')][String] $Type;
	[String[]] $ValidateSet;
}

<#
.SYNOPSIS
	Generates PowerShell source code for a function that outputs HTML. Consider
	using the `_new_tag` helper instead.

.DESCRIPTION
	Generate a function that will itself output HTML. The calling convention for
	this function is a bit painful (specifically the Attributes paraneter); you
	should probably use the helper `_new_tag` function to more easily create new
	elements.

.PARAMETER Tag
	HTML element tag name. Cannot be blank, for obvious reasons.

.PARAMETER FunctionName
	Alternate name for the generated function. This parameter should be used
	whena tag name is also a cmdlet, function, command or reserved keyword and
	can't (or you would prefer not to) be used as the function name.

.PARAMETER Void
	Marks this element as a self-closing "void" paramater. This means that the
	element will be written as `<div />` instead of `<div></div>. Void elements
	cannot have an InnerHTML.
	
	See [Void element - Glossary of web terms | MDN](https://developer.mozilla.org/docs/Glossary/Void_element)
	for more information.

.PARAMETER Attributes
	List of tag attributes.
	
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

.EXAMPLE
	The following is an annotated definition for various HTML tags. PowerShell
	help tags have been broken with backslashes to prevent misinterpretation.
	
	_new_tag a -Help @"
	.\SYNOPSIS
	    HTML <a> (links) element

	.\PARAMETER Download
	    Use to mark link as downloadable, rather than a redirect.

	<... more help stuff ...>
	"@ -Params @(
	    @('Download', 'Switch'),    # The "download" attribute only needs to
	                                # be present to download a file.

	    @('DownloadStr', 'String'), # Alternative that allows you to request a
	                                # destination filename for the file. Not
	                                # guarenteed. This is special-cased within
	                                # the _map_attributes helper.

	    @('Href', 'String'),        # A plain String type allows freeform input.
	    @('HrefLang', 'String'),
	    @('Ping', 'String'),
	    @('ReferrerPolicy', 'String', $_referrer_policy),
	    @('Rel', 'OptionalString', $_rel),
	    @('Target', 'String', @('_self', '_blank', '_parent', '_top')),
	                            # A String type followed by an array of strings
	                            # will restrict the allowed arguments to that
	                            # set.
	    @('Type', 'String')
	)
	
	_new_tag data -FunctionName datatag -Params @(
	                            # "data" is a reserved keyword, so FunctionName
	                            # is used to give an alternative name.
	    @('Value', 'String'),
	    $null                   # If PowerShell is given an array like
	                            # @( @(...) ), it flattens the array into
	                            # @(...). This null element prevents that (it
	                            # is ignored)
	)
	
	_new_tag style -Params @(
	                            # When an argument can be freeform, but you
	                            # still want to show a list of suggestions, set
	                            # the type of that attribute to OptionalString.
	    @('Blocking', 'String', $_blocking),
	    <...>
	    @('Type', 'OptionalString', @('text/css', 'text/tailwindcss'))
)
#>
function New-HTMLElementFunction {
	param (
		[String] $Tag,
		[String] $FunctionName,
		[Switch] $Void,
		[String] $Help,
		[Collections.Generic.Dictionary[[String], [TypeValidateSet]]] $Attributes
	)
	
	if (-not $FunctionName) {
		$FunctionName = $Tag
	}
	
	$AttrParams = [System.Collections.Generic.List[String]]::new()
	
	$Attributes.Keys | % {
		$Name = $_
		$Type = $Attributes[$_].Type
		$Set = $Attributes[$_].ValidateSet
		
		if ($Set) {
			if ($Type -eq 'OptionalString') {
				$AttrParams.Add( "[ArgumentCompletions('$( $Set -join "', '" )')] [String] `${$Name},`n" )
			} else {
				$AttrParams.Add( "[ValidateSet('$( $Set -join "', '" )')] [$Type] `${$Name},`n" )
			}
		} else {
			$AttrParams.Add( "[$Type] `${$Name},`n" )
		}
	}
	
	return @"
$( if ('' -ne $Help) { @"
<#
$Help
#>
"@ })
# EXPORTFUNC $FunctionName
function $FunctionName {
	param (
		$( if (-not $Void) {
			"[Parameter(ValueFromPipeline)]`n`t`t`$InnerHTML,"
		} )

# &DEFBEGIN $tag/param
		$($AttrParams -join "`t`t")
# &DEFEND $tag/param
		[Hashtable] `$Attributes
	)
	
	$( if ($Void) {
		"New-HTMLElement -Tag $Tag -Attributes (_map_attributes `$PSBoundParameters) -Void"
	} else {
		"New-HTMLElement -Tag $Tag -Attributes (_map_attributes `$PSBoundParameters) -InnerHTML `$InnerHTML"
	} )
}

"@
}

function _generic_help($tag, $desc) {
	@"
.SYNOPSIS
	HTML <$tag> $(($null -ne $desc) ? "($desc) " : '')element
"@
}

<#
.SYNOPSIS
	Shorthand for adding an attribute and its properties to a dictionary

.PARAMETER Dict
	Target dictionary that will be modified.

.PARAMETER Attribute
	Attribute name.

.PARAMETER Type
	Attribute type. Can only be "String" (anything passed will be stringified)
	or "Switch" (or what is called a "Boolean attribute"), where the mere
	presence of this attribute toggles it.

.PARAMETER ValidateSet
	Only valid for Type = "String"|"OptionalString".
	
	Sets the list of allowed values for this
	attribute. In the `_new_tag` and `New-HTMLElementFunction` functions, you
	can set this attribute's type to `OptionalString` to make these values
	optional. They will instead be suggestions.
#>
function _add_attr {
	param (
		$Dict,
		[String] $Attribute,
		[String] $Type,
		[AllowNull()]
		[String[]] $ValidateSet
	)
	
	$Dict.Add( $Attribute, [TypeValidateSet]@{Type=$Type; ValidateSet=$ValidateSet} )
}

function _new_tag {
	param (
		[String] $Tag,
		[Switch] $Void,
		[String] $Help,
		[String] $FunctionName,
		$Params
	)
	
	if ($Script:GLOBAL_ATTR) {
		$Dict = [Collections.Generic.Dictionary[[String],[TypeValidateSet]]]::new($Script:GLOBAL_ATTR)
	} else {
		$Dict = [Collections.Generic.Dictionary[[String],[TypeValidateSet]]]::new()
	}
	
	$Params | % {
		$Par = $_
		
		# powershell seems to collapse nested arrays like @( @(...) ) into]
		# @(...), so a null element should be added to prevent this; on seeing
		# it, it is skipped
		if ($null -eq $Par) { return }
		
		if ($_.Count -notin 2,3) { _log -type Warning "bad param count $($_.Count)" }
		
		_add_attr -Dict $dict -Attribute $Par[0] -Type $Par[1] -ValidateSet $Par[2]
	}
	
	if ($Tag -eq '__GLOBAL_ATTR__') {
		$Script:GLOBAL_ATTR = $Dict
		return
	}
	
	return New-HTMLElementFunction -Tag $Tag -FunctionName $FunctionName `
			-Attr $Dict -Void:$Void -Help $Help
}
#endregion

#region Presets for ValidateSet
$_referrer_policy = @('no-referrer', 'no-referrer-when-downgrade', 'origin',
		'origin-when-cross-origin', 'same-origin', 'strict-origin',
		'strict-origin-when-cross-origin', 'unsafe-url')
$_target = @('_self', '_blank', '_parent', '_top')
$_rel = @('about', 'alternate', 'amphtml', 'apple-touch-icon',
		'apple-touch-icon-precompressed', 'apple-touch-startup-image',
		'attachment', 'author', 'bookmark', 'canonical', 'category',
		'compression-dictionary', 'dns-prefetch', 'edit', 'expect', 'external',
		'help', 'icon', 'license', 'manifest', 'me', 'modulepreload', 'next',
		'nofollow', 'noopener', 'noreferrer', 'opener', 'pgpkey', 'pingback',
		'preconnect', 'preload', 'prerender', 'prev', 'privacy-policy',
		'profile', 'search', 'self', 'stylesheet', 'syndication', 'tag',
		'terms-of-service')
$_enctype = @('application/x-www-form-urlencoded', 'multipart/form-data',
		'text/plain')
$_method = @('post', 'get', 'dialog')
$_truefalse = @('true', 'false')
$_yesno = @('yes', 'no')
$_crossorigin = @('anonymous', 'use-credentials')
$_loading = @( 'eager', 'lazy' )
$_priority = @( 'high', 'low', 'auto' )
$_controllist = @('nodownload', 'nofullscreen', 'noremoteplayback')
$_blocking = @('render')
#endregion

#region Presets for -Help
$_help_href = @"
.PARAMETER Href
	Target link
"@

$_help_download = @"
.PARAMETER Download
	Use to mark link as downloadable, rather than a redirect.

.PARAMETER DownloadStr
	Same as Download, but allows input of a requested filename
"@

$_help_ping = @"
.PARAMETER Ping
	Space-separated list of URLs to "ping" when clicked. Used for tracking
	purposes, but might not work on all browsers.
"@

$_help_referrerpolicy = @"
.PARAMETER ReferrerPolicy
	Set Referer header for the destination. See https://developer.mozilla.org/docs/Web/HTML/Reference/Elements/a#referrerpolicy
	for specifics.
"@

$_help_rel = @"
.PARAMETER Rel
	Set relation between this page and the linked one. Tab completion values are
	suggestions; anything is technically valid. A best-practices guide is
	available at https://developer.mozilla.org/docs/Web/HTML/Reference/Attributes/rel
"@

$_help_target = @"
.PARAMETER Target
	Where to open the linked page. Generally, you should only need to use _self
	(current tab, default) and _blank (new tab/window)
"@
#endregion

#region HTML element definitions
# __GLOBAL_ATTR__ is a specially-cased tag that defined global attributes for
# all future elements
_new_tag __GLOBAL_ATTR__ -Params @(
	@('AccessKey', 'String'),
	@('Autocapitalize', 'String', @('none', 'off', 'sentences', 'on', 'words',
			'characters')),
	@('Autocorrect', 'String', @('on', 'off')),
	@('Autofocus', 'Switch'),
	@('Class', 'String'),
	@('ContentEditable', 'String', @('true', 'false', 'plaintext-only')),
	@('Dir', 'String', @('ltr', 'rtl', 'auto')),
	@('Draggable', 'String', $_truefalse),
	@('EnterKeyHint', 'String', @('enter', 'done', 'go', 'next', 'previous',
			'search', 'send')),
	@('Hidden', 'Switch'), # well not really... https://developer.mozilla.org/docs/Web/HTML/Reference/Global_attributes/hidden
	@('Id', 'String'),
	@('Inert', 'Switch'),
	@('InputMode', 'String', @('none', 'text', 'decimal', 'numeric', 'tel',
			'search', 'email', 'url')),
	@('ItemId', 'String'),
	@('ItemProp', 'String'),
	@('ItemRef', 'String'),
	@('ItemScope', 'Switch'),
	@('ItemType', 'String'),
	@('Lang', 'String'),
	@('Popover', 'String', @('auto', 'hint', 'manual')),
	@('Slot', 'String'),
	@('Spellcheck', 'String', $_truefalse),
	@('Style', 'String'),
	@('TabIndex', 'String'),
	@('Title', 'String'),
	@('Translate', 'String', $_yesno),
	@('VirtualKeyboardPolicy', 'String', @('auto', 'manual')),
	@('WritingSuggestions', 'String', $_truefalse),
	
	@('AriaHidden', 'String', $_truefalse),
	@('AriaSort', 'String', @('ascending', 'descending', 'other')),
	@('AriaLabel', 'String'),
	
	@('HxGet', 'String'),
	@('HxPost', 'String'),
	@('HxPush-Url', 'OptionalString', $_truefalse),
	@('HxSelect', 'String'),
	@('HxSelect-Oob', 'String'),
	@('HxSwap', 'OptionalString', @('innerHTML', 'outerHTML', 'textContent',
		'beforebegin','afterbegin', 'beforeend', 'afterend', 'delete', 'none')),
	@('HxSwap-Oob', 'String'),
	@('HxTarget', 'String'),
	@('HxTrigger', 'String'),
	@('HxVals', 'String')
	
	@('HxBoost', 'String', $_truefalse),
	@('HxConfirm', 'String'),
	@('HxDelete', 'String'),
	@('HxDisable', 'Switch'),
	@('HxDisabled-Elt', 'String'),
	@('HxDisinherit', 'String'),
	@('HxEncoding', 'String'),
	@('HxExt', 'String'),
	@('HxHeaders', 'String'),
	@('HxHistory', 'String'),
	@('HxHistory-Elt', 'String'),
	@('HxInclude', 'String'),
	@('HxIndicator', 'String'),
	@('HxInherit', 'String'),
	@('HxParams', 'String', @('*', 'none')),
	@('HxPatch', 'String'),
	@('HxPreserve', 'Switch'),
	@('HxPrompt', 'String'),
	@('HxPut', 'String'),
	@('HxReplace-Url', 'OptionalString', $_truefalse),
	@('HxRequest', 'String'),
	@('HxSync', 'OptionalString', @('drop', 'abort', 'replace', 'queue')),
	@('HxValidate', 'String', $_truefalse),
	@('HxVars', 'String'),
	
	@('_hs', 'String')
)

_new_tag a -Help @"
$(_generic_help a links)

$_help_download

$_help_href

.PARAMETER HrefLang
	Language code for link destination

$_help_ping

$_help_referrerpolicy

$_help_rel

$_help_target

.PARAMETER Type
	MIME type of destination content. Acts as a hint, but is usually ignored.
"@ -Params @(
	@('Download', 'Switch'),
	@('DownloadStr', 'String'),
	@('Href', 'String'),
	@('HrefLang', 'String'),
	@('Ping', 'String'),
	@('ReferrerPolicy', 'String', $_referrer_policy),
	@('Rel', 'OptionalString', $_rel),
	@('Target', 'String', $_target),
	@('Type', 'String')
)

_new_tag abbr -Help (_generic_help abbr abbreviation)

_new_tag address -Help (_generic_help address "contact info")

_new_tag area -Void -Help @"
$(_generic_help area "companion to <map>")

.PARAMETER Alt
	Alt text

.PARAMETER Coords
	Coordinates corresponding to the Shape

$_help_download

$_help_href

$_help_ping

$_help_referrerpolicy

$_help_rel

.PARAMETER Shape
	Shape of the clickable area.

$_help_target
"@ -Params @(
	@('Alt', 'String'),
	@('Coords', 'String'),
	@('Download', 'Switch'),
	@('DownloadStr', 'String'),
	@('Href', 'String'),
	@('Ping', 'String'),
	@('ReferrerPolicy', 'String', $_referrer_policy),
	@('Rel', 'OptionalString', $_rel),
	@('Shape', 'String', @('rect', 'circle', 'poly', 'default')),
	@('Target', 'String', $_target)
)

_new_tag article -Help (_generic_help article "semantically independent content area")

_new_tag aside -Help (_generic_help aside "semantically not-as-important content area")

_new_tag audio -Help @"
$(_generic_help audio)

.PARAMETER Autoplay
	Whether the element will start playing automatically. This might be	disabled
	by default in the browser.

.PARAMETER Controls
	Whether to show player controls or not.

.PARAMETER ControlsList
	Disable certain browser controls when Controls is used.

.PARAMETER CrossOrigin
	CORS policy for fetching remote resource.

.PARAMETER DisableRemotePlayback
	Disable video playback on "remote" destinations (external displays over
	wired and wireless connections)

.PARAMETER Loop
	Whether to loop the media.

.PARAMETER Muted
	Whether to start the audio muted.

.PARAMETER Preload
	Hints to the browser on how much data it should prepare.

.PARAMETER Src
	Audio source.
"@ -Params @(
	@('Autoplay', 'Switch'),
	@('Controls', 'Switch'),
	@('ControlsList', 'String', $_controllist),
	@('CrossOrigin', 'String', $_crossorigin),
	@('DisableRemotePlayback', 'Switch'),
	@('Loop', 'Switch'),
	@('Muted', 'Switch'),
	@('Preload', 'String', @('none', 'metadata', 'auto', '')),
	@('Src', 'String')
)

_new_tag b -Help (_generic_help b 'bold/"bring attention to"')

_new_tag base -Void -Help @"
$(_generic_help base "defines base URL for hrefs")

$_help_href

$_help_target
"@ -Params @(
	@('Href', 'String'),
	@('Target', 'String', $_target)
)

_new_tag bdi -Help (_generic_help bdi "bidirectional isolation")

_new_tag bdo -Help (_generic_help bdo "bidirectional override")

_new_tag blockquote -Help @"
$(_generic_help blockquote)

.PARAMETER Cite
	URL pointing to the source of the quote
"@ -Params @(
	@('Cite', 'String'),
	$null
)

_new_tag body -Help (_generic_help body)

_new_tag br -Void -Help (_generic_help br linebreak)

_new_tag button -Help @"
$(_generic_help button)

.PARAMETER Command
	<description here :: https://html.spec.whatwg.org/#attr-button-command>

.PARAMETER CommandFor
	Target for the Command attribute.

.PARAMETER Disable
	Makes this element unclickable.

.PARAMETER Form
	Link this button to a form at the specified ID.

.PARAMETER FormAction
	URL target for the form. Overrides the ``<form>``'s ``action``.

.PARAMETER FormEncType
	Set the form's encoding type. Overrides the ``<form>``'s ``EncType``.

.PARAMETER FormMethod
	Set the HTTP method used to submit the form. Overrides the ``<form>``'s
	``Method``.

.PARAMETER FormNoValidate
	Whether to perform form validation upon submission.

.PARAMETER FormTarget
	Where to open the form results. Generally, you should only need to use _self
	(current tab) and _blank (new tab/window)

.PARAMETER Name
	Button name in the form submission.

.PARAMETER PopoverTarget
	ID of the target popover.

.PARAMETER PopoverTargetAction
	What action to take on the target popover.

.PARAMETER Type
	Form behavior of the button. Use ``button`` when it isn't part of a form,
	or uses scripting to perform actions.

.PARAMETER Value
	This button's name when it is submitted in a form.
"@ -Params @(
	@('Command', 'String', @('show-modal', 'close', 'request-close',
			'show-popover', 'hide-popover', 'toggle-popover')),
	@('CommandFor', 'String'),
	@('Disabled', 'Switch'),
	@('Form', 'String'),
	@('FormAction', 'String'),
	@('FormEncType', 'String', $_enctype),
	@('FormMethod', 'String', $_method),
	@('FormNoValidate', 'Switch'),
	@('FormTarget', 'String', $_target),
	@('Name', 'String'),
	@('PopoverTarget', 'String'),
	@('PopoverTargetAction', 'String', @('hide', 'show', 'toggle' )),
	@('Type', 'String', @('submit', 'reset', 'button')),
	@('Value', 'String')
)

_new_tag canvas -Help @"
$(_generic_help canvas "drawing target")

.PARAMETER Height
	Canvas height in pixels.

.PARAMETER Width
	Canvas width in pixels.
"@ -Params @(
	@('Height', 'String'),
	@('Width', 'String')
)

_new_tag caption -Help (_generic_help caption "for tables")

_new_tag cite -Help (_generic_help cite "for titles of cited works")

_new_tag code -Help (_generic_help code)

_new_tag col -Void -Help @"
$(_generic_help col "table column")

.PARAMETER Span
	When under a colgroup, specifies how many columns the group consumes.
"@ -Params @(
	@('Span', 'String'),
	$null
)

_new_tag colgroup -Help @"
$(_generic_help colgroup "group of columns")

.PARAMETER Span
	Specifies how many columns this entire colgroup consumes.
"@ -Params @(
	@('Span', 'String'),
	$null
)

_new_tag data -FunctionName datatag -Help (_generic_help data) -Params @(
	@('Value', 'String'),
	$null
)

_new_tag datalist -Help (_generic_help datalist "list of <options>s for an <input>")

_new_tag dd -Help (_generic_help dd "definition of a <dt> term")

_new_tag del -Help (_generic_help del "deleted/removed text") -Params @(
	@('Cite', 'String'),
	@('DateTime', 'String')
)

_new_tag details -Help (_generic_help details "collapsable widget for <summary>") -Params @(
	@('Open', 'Switch'),
	@('Name', 'String')
)

_new_tag dfn -Help (_generic_help dfn "term/word definition")

_new_tag dialog -Help (_generic_help dialog "dialog box/alert/modal/etc...") -Params @(
	@('ClosedBy', 'String', @('any', 'closerequest', 'none')),
	@('Open', 'Switch')
)

_new_tag div -Help (_generic_help div)

_new_tag dl -Help (_generic_help dl "list of <dt> terms and their <dd> definitions")

_new_tag dt -Help (_generic_help dt "term for a <dl>")

_new_tag em -Help (_generic_help em "emphasis")

_new_tag embed -Help (_generic_help embed) -Void -Params @(
	@('Height', 'String'),
	@('Src', 'String'),
	@('Type', 'String'),
	@('Width', 'String')
)

_new_tag fencedframe -Help (_generic_help fencedframe "next-generation iframe") -Params @(
	@('Allow', 'String'),
	@('Height', 'String'),
	@('Width', 'String')
)

_new_tag fieldset -Help (_generic_help fieldset) -Params @(
	@('Disabled', 'Switch'),
	@('Form', 'String'),
	@('Name', 'String')
)

_new_tag figcaption -Help (_generic_help figcaption)

_new_tag figure -Help (_generic_help figure)

_new_tag footer -Help (_generic_help footer)

_new_tag form -Help (_generic_help form) -Params @(
	@('Accept', 'String'),
	@('Autocomplete', 'String', @('on', 'off')),
	@('Name', 'String'),
	@('Rel', 'OptionalString', $_rel),
	@('Action', 'String'),
	@('EncType', 'String', $_enctype),
	@('Method', 'String', $_method),
	@('NoValidate', 'Switch'),
	@('Target', 'String', $_target)
)

1..6 | % {
	_new_tag "h$_"  -Help (_generic_help "h$_")
}

_new_tag head -Help (_generic_help head)

_new_tag header -Help (_generic_help header)

_new_tag hgroup -Help (_generic_help hgroup "group of headers")

_new_tag hr -Void -Help (_generic_help hr)

_new_tag html -Help (_generic_help html) -Params @(
	@('Xmlns', 'String'),
	$null
)

_new_tag i -Help (_generic_help i "idiomatic (previously italic)")

_new_tag iframe -Help (_generic_help iframe) -Params @(
	@('AllowFullscreen', 'String', $_truefalse),
	@('AllowPaymentRequest', 'String', $_truefalse),
	@('Credentialless', 'String', $_truefalse),
	@('CSP', 'String'),
	@('Height', 'String'),
	@('Loading', 'String', $_loading),
	@('Name', 'String'),
	@('ReferrerPolicy', 'String', $_referrer_policy),
	@('Sandbox', 'String', @('allow-downloads', 'allow-forms', 'allow-modals',
			'allow-orientation-lock', 'allow-pointer-lock', 'allow-popups',
			'allow-popups-to-escape-sandbox', 'allow-presentation',
			'allow-same-origin', 'allow-scripts',
			'allow-storage-access-by-user-activation', 'allow-top-navigation',
			'allow-top-navigation-by-user-activation',
			'allow-top-navigation-to-custom-protocols')),
	@('Src', 'String'),
	@('SrcDoc', 'String'),
	@('Width', 'String')
)

_new_tag img -Void -Help (_generic_help img) -Params @(
	@('Alt', 'String'),
	@('AttributionSrc', 'String'),
	@('CrossOrigin', 'String', $_crossorigin),
	@('Decoding', 'String', @('sync', 'async', 'auto')),
	@('ElementTiming', 'String'),
	@('FetchPriority', 'String', $_priority),
	@('Height', 'String'),
	@('IsMap', 'Switch'),
	@('Loading', 'String', $_loading),
	@('ReferrerPolicy', 'String', $_referrer_policy),
	@('Sizes', 'OptionalString', @('auto')),
	@('Src', 'String'),
	@('SrcSet', 'String'),
	@('Width', 'String'),
	@('UseMap', 'String')
)

_new_tag input -Void -Help (_generic_help input) -Params @(
	@('Type', 'String', @('button', 'checkbox', 'color', 'data',
			'datetime-local', 'email', 'file', 'hidden', 'image', 'month',
			'number', 'password', 'radio', 'range', 'reset', 'search', 'submit',
			'tel', 'text', 'time', 'url', 'week')),
	@('Accept', 'String')
	@('Alt', 'String'),
	@('Autocomplete', 'String'),
	@('Capture', 'OptionalString', @('user', 'environment')),
	@('Checked', 'Switch'),
	@('Dirname', 'String'),
	@('Disabled', 'Switch'),
	@('Form', 'String'),
	@('FormAction', 'String'),
	@('FormEncType', 'String', $_enctype),
	@('FormMethod', 'String', $_method),
	@('FormNoValidate', 'String'),
	@('FormTarget', 'String', $_target),
	@('Height', 'String'),
	@('List', 'String'),
	@('Max', 'String'),
	@('MaxLength', 'String'),
	@('Min', 'String'),
	@('MinLength', 'String'),
	@('Multiple', 'Switch'),
	@('Name', 'String'),
	@('Pattern', 'String'),
	@('Placeholder', 'String'),
	@('Readonly', 'Switch'),
	@('Required', 'Switch'),
	@('Size', 'String'),
	@('Src', 'String'),
	@('Step', 'String'),
	@('Value', 'String'),
	@('Width', 'String')
)

_new_tag ins -Help (_generic_help ins "added/inserted text") -Params @(
	@('Cite', 'String'),
	@('DateTime', 'String')
)

_new_tag kbd -Help (_generic_help kbd "keyboard key")

_new_tag label -Help (_generic_help label) -Params @(
	@('For', 'String'),
	$null
)

_new_tag legend -Help (_generic_help legend)

_new_tag li -Help (_generic_help list "list item") -Params @(
	@('Value', 'String'),
	$null
)

_new_tag link -Void  -Help (_generic_help link)-Params @(
	@('As', 'String', @('audio', 'document', 'embed', 'fetch', 'font', 'image',
			'object', 'script', 'style', 'track', 'video', 'worker')),
	@('Blocking', 'String', $_blocking),
	@('CrossOrigin', 'String', $_crossorigin),
	@('Disabled', 'Switch'),
	@('FetchPriority', 'String', $_priority),
	@('Href', 'String'),
	@('HrefLand', 'String'),
	@('ImageSize', 'String'),
	@('ImageSrcSet', 'String'),
	@('Integrity', 'String'),
	@('Media', 'String')
	@('ReferrerPolicy', 'String', $_referrer_policy),
	@('Rel', 'String', $_rel),
	@('Sizes', 'String'),
	@('Type', 'String')
)

_new_tag main -Help (_generic_help main "main content of a <body>")

_new_tag map -Help (_generic_help map "image map") -Params @(
	@('Name', 'String'),
	$null
)

_new_tag mark -Help (_generic_help mark "marked/highlighted text")

# i 🤎 <marquee>
_new_tag marquee -Help (_generic_help marquee "(deprecated)") -Params @(
	@('Behavior', 'String', @('scroll', 'slide', 'altternate')),
	@('Direction', 'String', @('left', 'right', 'up', 'down')),
	@('Height', 'String'),
	@('HSpace', 'String'),
	@('Loop', 'String'),
	@('ScrollAmount', 'String'),
	@('ScrollDelay', 'String'),
	@('TrueSpeed', 'Switch'),
	@('VSpace', 'String'),
	@('Width', 'String')
)

_new_tag menu -Help (_generic_help menu "toolbar, or something")

_new_tag meta -Help (_generic_help meta) -Void -Params @(
	@('Charset', 'String', @('utf-8')),
	@('Content', 'String'),
	@('HttpEquiv', 'String', @('content-security-policy', 'content-type',
			'default-style', 'x-ua-compatible', 'refresh')),
	@('Media', 'String'),
	@('Name', 'String')
)

_new_tag meter -Help (_generic_help meter) -Params @(
	@('Value', 'String'),
	@('Min', 'String'),
	@('Max', 'String'),
	@('Low', 'String'),
	@('High', 'String'),
	@('Optimum', 'String'),
	@('Form', 'String')
)

_new_tag nav -Help (_generic_help nav)

_new_tag noscript -Help (_generic_help noscript)

_new_tag object -Help (_generic_help object)

_new_tag ol -Help (_generic_help ol "ordered list") -Params @(
	@('Reversed', 'Switch'),
	@('Start', 'String')
)

_new_tag optgroup -Help (_generic_help optgroup "group of <options> in a <select>") -Params @(
	@('Disabled', 'Switch'),
	@('Label', 'String')
)

_new_tag option -Help (_generic_help option "choice in a <select> or <datalist>") -Params @(
	@('Disabled', 'Switch'),
	@('Label', 'String'),
	@('Selected', 'Switch'),
	@('Value', 'String')
)

_new_tag output -Help (_generic_help output) -Params @(
	@('For', 'String'),
	@('Form', 'String'),
	@('Name', 'String')
)

_new_tag p -Help (_generic_help p)

_new_tag picture -Help (_generic_help picture "alternatives of an image")

_new_tag pre -Help (_generic_help pre "pre-formatted text")

_new_tag progress -Help (_generic_help progress) -Params @(
	@('Max', 'String'),
	@('Value', 'String')
)

_new_tag q -Help (_generic_help q "quotation") -Params @(
	@('Cite', 'String'),
	$null
)

_new_tag rb -Help (_generic_help rb "(deprecated, use just <ruby>) ruby body")

_new_tag rp -Help (_generic_help rp "fallback ruby parenthesis")

_new_tag rt -Help (_generic_help rt "ruby text")

_new_tag rtc -Help (_generic_help rtc "(deprecated) ruby text container")

_new_tag ruby -Help (_generic_help ruby "ruby annotation")

_new_tag s -Help (_generic_help s "strikethrough")

_new_tag samp -Help (_generic_help samp "sample output")

_new_tag script -Help (_generic_help script) -Params @(
	@('Async', 'Switch'),
	@('Blocking', 'String', $_blocking),
	@('CrossOrigin', 'String', $_crossorigin),
	@('Defer', 'Switch'),
	@('FetchPriority', 'String', $_priority),
	@('Integrity', 'String'),
	@('NoModule', 'Switch'),
	@('Nonce', 'String'),
	@('ReferrerPolicy', 'String', $_referrer_policy),
	@('Src', 'String'),
	@('Type', 'OptionalString', @('importmap', 'module', 'speculationrules',
			'text/javascript', 'text/hyperscript'))
)

_new_tag search -Help (_generic_help search)

_new_tag section -Help (_generic_help section "semantic section of content")

_new_tag select -Help (_generic_help select "dropdown") -FunctionName selecttag -Params @(
	@('Disabled', 'Switch'),
	@('Form', 'String'),
	@('Multiple', 'Switch'),
	@('Name', 'String'),
	@('Required', 'Switch'),
	@('Size', 'String')
)

_new_tag slot -Help (_generic_help "insertion area for a component <template>") -Params @(
	@('Name', 'String'),
	$null
)

_new_tag small -Help (_generic_help small "small text")

_new_tag source -Help (_generic_help source "options for media elements") -Void -Params @(
	@('Type', 'String'),
	@('Src', 'String'),
	@('SrcSet', 'String'),
	@('Sizes', 'String'),
	@('Media', 'String'),
	@('Height', 'String'),
	@('Width', 'String')
)

_new_tag span -Help (_generic_help span)

_new_tag strong -Help (_generic_help strong "important text")

_new_tag style -Help (_generic_help style) -Params @(
	@('Blocking', 'String', $_blocking),
	@('Media', 'String'),
	@('Nonce', 'String'),
	@('Type', 'OptionalString', @('text/css', 'text/tailwindcss'))
)

_new_tag sub -Help (_generic_help sub subscript)

_new_tag summary -Help (_generic_help summary "for <details")

_new_tag sup -Help (_generic_help sup superscript)

_new_tag table -Help (_generic_help table)

_new_tag tbody -Help (_generic_help tbody)

_new_tag td -Help (_generic_help td "table cell") -Params @(
	@('ColSpan', 'String'),
	@('Headers', 'String'),
	@('RowSpan', 'String')
)

_new_tag template -Help (_generic_help template "HTML fragment for templating in JS") -Params @(
	@('ShadowRootMode', 'String', @('open', 'closed')),
	@('ShadowRootClonable', 'String'),
	@('ShadowRootDelegatesFocus', 'String'),
	@('ShadowRootSerializable', 'String')
)

_new_tag textarea -Help (_generic_help textarea "multi-line text input") -Params @(
	@('Cols', 'String'),
	@('DirName', 'String'),
	@('Disabled', 'Switch'),
	@('Form', 'String'),
	@('MaxLength', 'String'),
	@('MinLength', 'String'),
	@('Name', 'String'),
	@('Placeholder', 'String'),
	@('ReadOnly', 'Switch'),
	@('Required', 'Switch'),
	@('Rows', 'String'),
	@('Wrap', 'String', @('hard', 'soft', 'off'))
)

_new_tag tfoot -Help (_generic_help tfoot)

_new_tag th -Help (_generic_help th) -Params @(
	@('Abbr', 'String'),
	@('ColSpan', 'String'),
	@('Headers', 'String'),
	@('RowSpan', 'String'),
	@('Scope', 'String', @('row', 'col', 'rowgroup', 'colgroup'))
)

_new_tag thead -Help (_generic_help thead)

_new_tag time -Help (_generic_help time) -Params @(
	@('datetime', 'String'),
	$null
)

_new_tag title -Help (_generic_help title)

_new_tag tr -Help (_generic_help tr)

_new_tag track -Help (_generic_help track "for audio and video") -Void -Params @(
	@('Default', 'Switch'),
	@('Kind', 'String', @('subtitles', 'captions', 'chapters', 'metadata')),
	@('Label', 'String'),
	@('Src', 'String'),
	@('SrcLang', 'String')
)

_new_tag u -Help (_generic_help u "unarticulated annotation (previously underline)")

_new_tag ul -Help (_generic_help ul "unordered list")

_new_tag var -Help (_generic_help var "mathematical variable") -FunctionName vartag

_new_tag video -Help (_generic_help video) -Params @(
	@('Autoplay', 'Switch'),
	@('Controls', 'Switch'),
	@('ControlList', 'String', $_controllist),
	@('CrossOrigin', 'String', $_crossorigin),
	@('DisablePictureInPicture', 'Switch'),
	@('DisableRemotePlayback', 'Switch'),
	@('Height', 'String'),
	@('Loop', 'Switch'),
	@('Muted', 'Switch'),
	@('PlaysInline', 'Switch'),
	@('Poster', 'String'),
	@('Preload', 'String', @('none', 'metadata', 'auto')),
	@('Src', 'String'),
	@('Width', 'String')
)

_new_tag wbr -Help (_generic_help wbr "line break opportunity") -Void
#endregion
