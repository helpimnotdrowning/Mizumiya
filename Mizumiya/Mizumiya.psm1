# WARNING: This file was automaticaly generated on 2025-06-19T08:18:23.0413146Z
# Do not manually modify this file. Your changes will be overwritten.
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

function _log {
	param(
		[Parameter(ValueFromPipeline)]
		$Message,
		[ValidateSet('', 'Information', 'Warning', 'Fatal')]
		$Type
	)
	
	switch ($Type) {
		{$_ -eq '' -or $_ -eq 'Information'} {
			$Style = ''
			$Type = 'Information'
		}
		
		'Warning' {
			$Style = $PSStyle.Formatting.Warning
		}
		
		'Fatal' {
			$Style = $PSStyle.Formatting.Error
		}
	}
	
	# this log style may or may not be inspired by Minecraft
	Write-Host "$Style[$(get-date -Format 'yyyy-MM-dd HH:mm:ss')] [Mizumiya/$Type] $Message$($PSStyle.Reset)"
	if ($Type -eq 'Fatal') { throw $Message }
}

function _info {
	param(
		[Parameter(ValueFromPipeline)]
		$Message
	)

	_log -Type Information -Message $Message
}

function _warn {
	param(
		[Parameter(ValueFromPipeline)]
		$Message
	)

	_log -Type Warning -Message $Message
}

function _fatal {
	param (
		[Parameter(ValueFromPipeline)]
		$Message
	)
	
	_log -Type Fatal $Message
}

<#
.SYNOPSIS
	HTML <a> (links) element

.PARAMETER Download
	Use to mark link as downloadable, rather than a redirect.

.PARAMETER DownloadStr
	Same as Download, but allows input of a requested filename

.PARAMETER Href
	Target link

.PARAMETER HrefLang
	Language code for link destination

.PARAMETER Ping
	Space-separated list of URLs to "ping" when clicked. Used for tracking
	purposes, but might not work on all browsers.

.PARAMETER ReferrerPolicy
	Set Referer header for the destination. See https://developer.mozilla.org/docs/Web/HTML/Reference/Elements/a#referrerpolicy
	for specifics.

.PARAMETER Rel
	Set relation between this page and the linked one. Tab completion values are
	suggestions; anything is technically valid. A best-practices guide is
	available at https://developer.mozilla.org/docs/Web/HTML/Reference/Attributes/rel

.PARAMETER Target
	Where to open the linked page. Generally, you should only need to use _self
	(current tab, default) and _blank (new tab/window)

.PARAMETER Type
	MIME type of destination content. Acts as a hint, but is usually ignored.
#>
# EXPORTFUNC a
function a {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Download},
		[String] ${DownloadStr},
		[String] ${Href},
		[String] ${HrefLang},
		[String] ${Ping},
		[ValidateSet('no-referrer', 'no-referrer-when-downgrade', 'origin', 'origin-when-cross-origin', 'same-origin', 'strict-origin', 'strict-origin-when-cross-origin', 'unsafe-url')] [String] ${ReferrerPolicy},
		[ArgumentCompletions('about', 'alternate', 'amphtml', 'apple-touch-icon', 'apple-touch-icon-precompressed', 'apple-touch-startup-image', 'attachment', 'author', 'bookmark', 'canonical', 'category', 'compression-dictionary', 'dns-prefetch', 'edit', 'expect', 'external', 'help', 'icon', 'license', 'manifest', 'me', 'modulepreload', 'next', 'nofollow', 'noopener', 'noreferrer', 'opener', 'pgpkey', 'pingback', 'preconnect', 'preload', 'prerender', 'prev', 'privacy-policy', 'profile', 'search', 'self', 'stylesheet', 'syndication', 'tag', 'terms-of-service')] [String] ${Rel},
		[ValidateSet('_self', '_blank', '_parent', '_top')] [String] ${Target},
		[String] ${Type},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag a -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <abbr> (abbreviation) element
#>
# EXPORTFUNC abbr
function abbr {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag abbr -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <address> (contact info) element
#>
# EXPORTFUNC address
function address {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag address -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <area> (companion to <map>) element

.PARAMETER Alt
	Alt text

.PARAMETER Coords
	Coordinates corresponding to the Shape

.PARAMETER Download
	Use to mark link as downloadable, rather than a redirect.

.PARAMETER DownloadStr
	Same as Download, but allows input of a requested filename

.PARAMETER Href
	Target link

.PARAMETER Ping
	Space-separated list of URLs to "ping" when clicked. Used for tracking
	purposes, but might not work on all browsers.

.PARAMETER ReferrerPolicy
	Set Referer header for the destination. See https://developer.mozilla.org/docs/Web/HTML/Reference/Elements/a#referrerpolicy
	for specifics.

.PARAMETER Rel
	Set relation between this page and the linked one. Tab completion values are
	suggestions; anything is technically valid. A best-practices guide is
	available at https://developer.mozilla.org/docs/Web/HTML/Reference/Attributes/rel

.PARAMETER Shape
	Shape of the clickable area.

.PARAMETER Target
	Where to open the linked page. Generally, you should only need to use _self
	(current tab, default) and _blank (new tab/window)
#>
# EXPORTFUNC area
function area {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Alt},
		[String] ${Coords},
		[Switch] ${Download},
		[String] ${DownloadStr},
		[String] ${Href},
		[String] ${Ping},
		[ValidateSet('no-referrer', 'no-referrer-when-downgrade', 'origin', 'origin-when-cross-origin', 'same-origin', 'strict-origin', 'strict-origin-when-cross-origin', 'unsafe-url')] [String] ${ReferrerPolicy},
		[ArgumentCompletions('about', 'alternate', 'amphtml', 'apple-touch-icon', 'apple-touch-icon-precompressed', 'apple-touch-startup-image', 'attachment', 'author', 'bookmark', 'canonical', 'category', 'compression-dictionary', 'dns-prefetch', 'edit', 'expect', 'external', 'help', 'icon', 'license', 'manifest', 'me', 'modulepreload', 'next', 'nofollow', 'noopener', 'noreferrer', 'opener', 'pgpkey', 'pingback', 'preconnect', 'preload', 'prerender', 'prev', 'privacy-policy', 'profile', 'search', 'self', 'stylesheet', 'syndication', 'tag', 'terms-of-service')] [String] ${Rel},
		[ValidateSet('rect', 'circle', 'poly', 'default')] [String] ${Shape},
		[ValidateSet('_self', '_blank', '_parent', '_top')] [String] ${Target},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag area -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <article> (semantically independent content area) element
#>
# EXPORTFUNC article
function article {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag article -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <aside> (semantically not-as-important content area) element
#>
# EXPORTFUNC aside
function aside {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag aside -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <audio> element

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
#>
# EXPORTFUNC audio
function audio {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Autoplay},
		[Switch] ${Controls},
		[ValidateSet('nodownload', 'nofullscreen', 'noremoteplayback')] [String] ${ControlsList},
		[ValidateSet('anonymous', 'use-credentials')] [String] ${CrossOrigin},
		[Switch] ${DisableRemotePlayback},
		[Switch] ${Loop},
		[Switch] ${Muted},
		[ValidateSet('none', 'metadata', 'auto', '')] [String] ${Preload},
		[String] ${Src},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag audio -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <b> (bold/"bring attention to") element
#>
# EXPORTFUNC b
function b {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag b -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <base> (defines base URL for hrefs) element

.PARAMETER Href
	Target link

.PARAMETER Target
	Where to open the linked page. Generally, you should only need to use _self
	(current tab, default) and _blank (new tab/window)
#>
# EXPORTFUNC base
function base {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Href},
		[ValidateSet('_self', '_blank', '_parent', '_top')] [String] ${Target},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag base -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <bdi> (bidirectional isolation) element
#>
# EXPORTFUNC bdi
function bdi {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag bdi -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <bdo> (bidirectional override) element
#>
# EXPORTFUNC bdo
function bdo {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag bdo -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <blockquote> element

.PARAMETER Cite
	URL pointing to the source of the quote
#>
# EXPORTFUNC blockquote
function blockquote {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Cite},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag blockquote -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <body> element
#>
# EXPORTFUNC body
function body {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag body -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <br> (linebreak) element
#>
# EXPORTFUNC br
function br {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag br -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <button> element

.PARAMETER Command
	<description here :: https://html.spec.whatwg.org/#attr-button-command>

.PARAMETER CommandFor
	Target for the Command attribute.

.PARAMETER Disabled
	Makes this element unclickable.

.PARAMETER Form
	Link this button to a form at the specified ID.

.PARAMETER FormAction
	URL target for the form. Overrides the `<form>`'s `action`.

.PARAMETER FormEncType
	Set the form's encoding type. Overrides the `<form>`'s `EncType`.

.PARAMETER FormMethod
	Set the HTTP method used to submit the form. Overrides the `<form>`'s
	`Method`.

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
	Form behavior of the button. Use `button` when it isn't part of a form,
	or uses scripting to perform actions.

.PARAMETER Value
	This button's name when it is submitted in a form.
#>
# EXPORTFUNC button
function button {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[ValidateSet('show-modal', 'close', 'request-close', 'show-popover', 'hide-popover', 'toggle-popover')] [String] ${Command},
		[String] ${CommandFor},
		[Switch] ${Disabled},
		[String] ${Form},
		[String] ${FormAction},
		[ValidateSet('application/x-www-form-urlencoded', 'multipart/form-data', 'text/plain')] [String] ${FormEncType},
		[ValidateSet('post', 'get', 'dialog')] [String] ${FormMethod},
		[Switch] ${FormNoValidate},
		[ValidateSet('_self', '_blank', '_parent', '_top')] [String] ${FormTarget},
		[String] ${Name},
		[String] ${PopoverTarget},
		[ValidateSet('hide', 'show', 'toggle')] [String] ${PopoverTargetAction},
		[ValidateSet('submit', 'reset', 'button')] [String] ${Type},
		[String] ${Value},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag button -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <canvas> (drawing target) element

.PARAMETER Height
	Canvas height in pixels.

.PARAMETER Width
	Canvas width in pixels.
#>
# EXPORTFUNC canvas
function canvas {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Height},
		[String] ${Width},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag canvas -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <caption> (for tables) element
#>
# EXPORTFUNC caption
function caption {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag caption -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <cite> (for titles of cited works) element
#>
# EXPORTFUNC cite
function cite {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag cite -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <code> element
#>
# EXPORTFUNC code
function code {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag code -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <col> (table column) element

.PARAMETER Span
	When under a colgroup, specifies how many columns the group consumes.
#>
# EXPORTFUNC col
function col {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Span},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag col -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <colgroup> (group of columns) element

.PARAMETER Span
	Specifies how many columns this entire colgroup consumes.
#>
# EXPORTFUNC colgroup
function colgroup {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Span},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag colgroup -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <data> element
#>
# EXPORTFUNC datatag
function datatag {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Value},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag data -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <datalist> (list of <options>s for an <input>) element
#>
# EXPORTFUNC datalist
function datalist {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag datalist -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <dd> (definition of a <dt> term) element
#>
# EXPORTFUNC dd
function dd {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag dd -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <del> (deleted/removed text) element
#>
# EXPORTFUNC del
function del {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Cite},
		[String] ${DateTime},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag del -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <details> (collapsable widget for <summary>) element
#>
# EXPORTFUNC details
function details {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Open},
		[String] ${Name},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag details -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <dfn> (term/word definition) element
#>
# EXPORTFUNC dfn
function dfn {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag dfn -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <dialog> (dialog box/alert/modal/etc...) element
#>
# EXPORTFUNC dialog
function dialog {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[ValidateSet('any', 'closerequest', 'none')] [String] ${ClosedBy},
		[Switch] ${Open},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag dialog -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <div> element
#>
# EXPORTFUNC div
function div {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag div -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <dl> (list of <dt> terms and their <dd> definitions) element
#>
# EXPORTFUNC dl
function dl {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag dl -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <dt> (term for a <dl>) element
#>
# EXPORTFUNC dt
function dt {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag dt -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <em> (emphasis) element
#>
# EXPORTFUNC em
function em {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag em -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <embed> element
#>
# EXPORTFUNC embed
function embed {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Height},
		[String] ${Src},
		[String] ${Type},
		[String] ${Width},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag embed -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <fencedframe> (next-generation iframe) element
#>
# EXPORTFUNC fencedframe
function fencedframe {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Allow},
		[String] ${Height},
		[String] ${Width},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag fencedframe -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <fieldset> element
#>
# EXPORTFUNC fieldset
function fieldset {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Disabled},
		[String] ${Form},
		[String] ${Name},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag fieldset -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <figcaption> element
#>
# EXPORTFUNC figcaption
function figcaption {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag figcaption -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <figure> element
#>
# EXPORTFUNC figure
function figure {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag figure -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <footer> element
#>
# EXPORTFUNC footer
function footer {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag footer -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <form> element
#>
# EXPORTFUNC form
function form {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Accept},
		[ValidateSet('on', 'off')] [String] ${Autocomplete},
		[String] ${Name},
		[ArgumentCompletions('about', 'alternate', 'amphtml', 'apple-touch-icon', 'apple-touch-icon-precompressed', 'apple-touch-startup-image', 'attachment', 'author', 'bookmark', 'canonical', 'category', 'compression-dictionary', 'dns-prefetch', 'edit', 'expect', 'external', 'help', 'icon', 'license', 'manifest', 'me', 'modulepreload', 'next', 'nofollow', 'noopener', 'noreferrer', 'opener', 'pgpkey', 'pingback', 'preconnect', 'preload', 'prerender', 'prev', 'privacy-policy', 'profile', 'search', 'self', 'stylesheet', 'syndication', 'tag', 'terms-of-service')] [String] ${Rel},
		[String] ${Action},
		[ValidateSet('application/x-www-form-urlencoded', 'multipart/form-data', 'text/plain')] [String] ${EncType},
		[ValidateSet('post', 'get', 'dialog')] [String] ${Method},
		[Switch] ${NoValidate},
		[ValidateSet('_self', '_blank', '_parent', '_top')] [String] ${Target},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag form -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <h1> element
#>
# EXPORTFUNC h1
function h1 {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag h1 -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <h2> element
#>
# EXPORTFUNC h2
function h2 {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag h2 -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <h3> element
#>
# EXPORTFUNC h3
function h3 {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag h3 -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <h4> element
#>
# EXPORTFUNC h4
function h4 {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag h4 -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <h5> element
#>
# EXPORTFUNC h5
function h5 {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag h5 -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <h6> element
#>
# EXPORTFUNC h6
function h6 {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag h6 -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <head> element
#>
# EXPORTFUNC head
function head {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag head -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <header> element
#>
# EXPORTFUNC header
function header {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag header -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <hgroup> (group of headers) element
#>
# EXPORTFUNC hgroup
function hgroup {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag hgroup -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <hr> element
#>
# EXPORTFUNC hr
function hr {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag hr -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <html> element
#>
# EXPORTFUNC html
function html {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Xmlns},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag html -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <i> (idiomatic (previously italic)) element
#>
# EXPORTFUNC i
function i {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag i -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <iframe> element
#>
# EXPORTFUNC iframe
function iframe {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[ValidateSet('true', 'false')] [String] ${AllowFullscreen},
		[ValidateSet('true', 'false')] [String] ${AllowPaymentRequest},
		[ValidateSet('true', 'false')] [String] ${Credentialless},
		[String] ${CSP},
		[String] ${Height},
		[ValidateSet('eager', 'lazy')] [String] ${Loading},
		[String] ${Name},
		[ValidateSet('no-referrer', 'no-referrer-when-downgrade', 'origin', 'origin-when-cross-origin', 'same-origin', 'strict-origin', 'strict-origin-when-cross-origin', 'unsafe-url')] [String] ${ReferrerPolicy},
		[ValidateSet('allow-downloads', 'allow-forms', 'allow-modals', 'allow-orientation-lock', 'allow-pointer-lock', 'allow-popups', 'allow-popups-to-escape-sandbox', 'allow-presentation', 'allow-same-origin', 'allow-scripts', 'allow-storage-access-by-user-activation', 'allow-top-navigation', 'allow-top-navigation-by-user-activation', 'allow-top-navigation-to-custom-protocols')] [String] ${Sandbox},
		[String] ${Src},
		[String] ${SrcDoc},
		[String] ${Width},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag iframe -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <img> element
#>
# EXPORTFUNC img
function img {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Alt},
		[String] ${AttributionSrc},
		[ValidateSet('anonymous', 'use-credentials')] [String] ${CrossOrigin},
		[ValidateSet('sync', 'async', 'auto')] [String] ${Decoding},
		[String] ${ElementTiming},
		[ValidateSet('high', 'low', 'auto')] [String] ${FetchPriority},
		[String] ${Height},
		[Switch] ${IsMap},
		[ValidateSet('eager', 'lazy')] [String] ${Loading},
		[ValidateSet('no-referrer', 'no-referrer-when-downgrade', 'origin', 'origin-when-cross-origin', 'same-origin', 'strict-origin', 'strict-origin-when-cross-origin', 'unsafe-url')] [String] ${ReferrerPolicy},
		[ArgumentCompletions('auto')] [String] ${Sizes},
		[String] ${Src},
		[String] ${SrcSet},
		[String] ${Width},
		[String] ${UseMap},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag img -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <input> element
#>
# EXPORTFUNC input
function input {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[ValidateSet('button', 'checkbox', 'color', 'data', 'datetime-local', 'email', 'file', 'hidden', 'image', 'month', 'number', 'password', 'radio', 'range', 'reset', 'search', 'submit', 'tel', 'text', 'time', 'url', 'week')] [String] ${Type},
		[String] ${Accept},
		[String] ${Alt},
		[String] ${Autocomplete},
		[ArgumentCompletions('user', 'environment')] [String] ${Capture},
		[Switch] ${Checked},
		[String] ${Dirname},
		[Switch] ${Disabled},
		[String] ${Form},
		[String] ${FormAction},
		[ValidateSet('application/x-www-form-urlencoded', 'multipart/form-data', 'text/plain')] [String] ${FormEncType},
		[ValidateSet('post', 'get', 'dialog')] [String] ${FormMethod},
		[String] ${FormNoValidate},
		[ValidateSet('_self', '_blank', '_parent', '_top')] [String] ${FormTarget},
		[String] ${Height},
		[String] ${List},
		[String] ${Max},
		[String] ${MaxLength},
		[String] ${Min},
		[String] ${MinLength},
		[Switch] ${Multiple},
		[String] ${Name},
		[String] ${Pattern},
		[String] ${Placeholder},
		[Switch] ${Readonly},
		[Switch] ${Required},
		[String] ${Size},
		[String] ${Src},
		[String] ${Step},
		[String] ${Value},
		[String] ${Width},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag input -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <ins> (added/inserted text) element
#>
# EXPORTFUNC ins
function ins {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Cite},
		[String] ${DateTime},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag ins -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <kbd> (keyboard key) element
#>
# EXPORTFUNC kbd
function kbd {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag kbd -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <label> element
#>
# EXPORTFUNC label
function label {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${For},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag label -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <legend> element
#>
# EXPORTFUNC legend
function legend {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag legend -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <list> (list item) element
#>
# EXPORTFUNC li
function li {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Value},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag li -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <link> element
#>
# EXPORTFUNC link
function link {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[ValidateSet('audio', 'document', 'embed', 'fetch', 'font', 'image', 'object', 'script', 'style', 'track', 'video', 'worker')] [String] ${As},
		[ValidateSet('render')] [String] ${Blocking},
		[ValidateSet('anonymous', 'use-credentials')] [String] ${CrossOrigin},
		[Switch] ${Disabled},
		[ValidateSet('high', 'low', 'auto')] [String] ${FetchPriority},
		[String] ${Href},
		[String] ${HrefLand},
		[String] ${ImageSize},
		[String] ${ImageSrcSet},
		[String] ${Integrity},
		[String] ${Media},
		[ValidateSet('no-referrer', 'no-referrer-when-downgrade', 'origin', 'origin-when-cross-origin', 'same-origin', 'strict-origin', 'strict-origin-when-cross-origin', 'unsafe-url')] [String] ${ReferrerPolicy},
		[ValidateSet('about', 'alternate', 'amphtml', 'apple-touch-icon', 'apple-touch-icon-precompressed', 'apple-touch-startup-image', 'attachment', 'author', 'bookmark', 'canonical', 'category', 'compression-dictionary', 'dns-prefetch', 'edit', 'expect', 'external', 'help', 'icon', 'license', 'manifest', 'me', 'modulepreload', 'next', 'nofollow', 'noopener', 'noreferrer', 'opener', 'pgpkey', 'pingback', 'preconnect', 'preload', 'prerender', 'prev', 'privacy-policy', 'profile', 'search', 'self', 'stylesheet', 'syndication', 'tag', 'terms-of-service')] [String] ${Rel},
		[String] ${Sizes},
		[String] ${Type},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag link -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <main> (main content of a <body>) element
#>
# EXPORTFUNC main
function main {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag main -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <map> (image map) element
#>
# EXPORTFUNC map
function map {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Name},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag map -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <mark> (marked/highlighted text) element
#>
# EXPORTFUNC mark
function mark {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag mark -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <marquee> ((deprecated)) element
#>
# EXPORTFUNC marquee
function marquee {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[ValidateSet('scroll', 'slide', 'altternate')] [String] ${Behavior},
		[ValidateSet('left', 'right', 'up', 'down')] [String] ${Direction},
		[String] ${Height},
		[String] ${HSpace},
		[String] ${Loop},
		[String] ${ScrollAmount},
		[String] ${ScrollDelay},
		[Switch] ${TrueSpeed},
		[String] ${VSpace},
		[String] ${Width},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag marquee -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <menu> (toolbar, or something) element
#>
# EXPORTFUNC menu
function menu {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag menu -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <meta> element
#>
# EXPORTFUNC meta
function meta {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[ValidateSet('utf-8')] [String] ${Charset},
		[String] ${Content},
		[ValidateSet('content-security-policy', 'content-type', 'default-style', 'x-ua-compatible', 'refresh')] [String] ${HttpEquiv},
		[String] ${Media},
		[String] ${Name},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag meta -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <meter> element
#>
# EXPORTFUNC meter
function meter {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Value},
		[String] ${Min},
		[String] ${Max},
		[String] ${Low},
		[String] ${High},
		[String] ${Optimum},
		[String] ${Form},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag meter -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <nav> element
#>
# EXPORTFUNC nav
function nav {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag nav -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <noscript> element
#>
# EXPORTFUNC noscript
function noscript {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag noscript -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <object> element
#>
# EXPORTFUNC object
function object {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag object -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <ol> (ordered list) element
#>
# EXPORTFUNC ol
function ol {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Reversed},
		[String] ${Start},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag ol -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <optgroup> (group of <options> in a <select>) element
#>
# EXPORTFUNC optgroup
function optgroup {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Disabled},
		[String] ${Label},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag optgroup -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <option> (choice in a <select> or <datalist>) element
#>
# EXPORTFUNC option
function option {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Disabled},
		[String] ${Label},
		[Switch] ${Selected},
		[String] ${Value},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag option -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <output> element
#>
# EXPORTFUNC output
function output {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${For},
		[String] ${Form},
		[String] ${Name},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag output -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <p> element
#>
# EXPORTFUNC p
function p {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag p -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <picture> (alternatives of an image) element
#>
# EXPORTFUNC picture
function picture {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag picture -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <pre> (pre-formatted text) element
#>
# EXPORTFUNC pre
function pre {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag pre -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <progress> element
#>
# EXPORTFUNC progress
function progress {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Max},
		[String] ${Value},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag progress -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <q> (quotation) element
#>
# EXPORTFUNC q
function q {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Cite},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag q -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <rb> ((deprecated, use just <ruby>) ruby body) element
#>
# EXPORTFUNC rb
function rb {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag rb -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <rp> (fallback ruby parenthesis) element
#>
# EXPORTFUNC rp
function rp {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag rp -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <rt> (ruby text) element
#>
# EXPORTFUNC rt
function rt {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag rt -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <rtc> ((deprecated) ruby text container) element
#>
# EXPORTFUNC rtc
function rtc {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag rtc -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <ruby> (ruby annotation) element
#>
# EXPORTFUNC ruby
function ruby {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag ruby -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <s> (strikethrough) element
#>
# EXPORTFUNC s
function s {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag s -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <samp> (sample output) element
#>
# EXPORTFUNC samp
function samp {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag samp -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <script> element
#>
# EXPORTFUNC script
function script {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Async},
		[ValidateSet('render')] [String] ${Blocking},
		[ValidateSet('anonymous', 'use-credentials')] [String] ${CrossOrigin},
		[Switch] ${Defer},
		[ValidateSet('high', 'low', 'auto')] [String] ${FetchPriority},
		[String] ${Integrity},
		[Switch] ${NoModule},
		[String] ${Nonce},
		[ValidateSet('no-referrer', 'no-referrer-when-downgrade', 'origin', 'origin-when-cross-origin', 'same-origin', 'strict-origin', 'strict-origin-when-cross-origin', 'unsafe-url')] [String] ${ReferrerPolicy},
		[String] ${Src},
		[ArgumentCompletions('importmap', 'module', 'speculationrules', 'text/javascript', 'text/hyperscript')] [String] ${Type},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag script -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <search> element
#>
# EXPORTFUNC search
function search {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag search -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <section> (semantic section of content) element
#>
# EXPORTFUNC section
function section {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag section -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <select> (dropdown) element
#>
# EXPORTFUNC selecttag
function selecttag {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Disabled},
		[String] ${Form},
		[Switch] ${Multiple},
		[String] ${Name},
		[Switch] ${Required},
		[String] ${Size},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag select -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <insertion area for a component <template>> element
#>
# EXPORTFUNC slot
function slot {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Name},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag slot -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <small> (small text) element
#>
# EXPORTFUNC small
function small {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag small -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <source> (options for media elements) element
#>
# EXPORTFUNC source
function source {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Type},
		[String] ${Src},
		[String] ${SrcSet},
		[String] ${Sizes},
		[String] ${Media},
		[String] ${Height},
		[String] ${Width},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag source -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <span> element
#>
# EXPORTFUNC span
function span {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag span -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <strong> (important text) element
#>
# EXPORTFUNC strong
function strong {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag strong -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <style> element
#>
# EXPORTFUNC style
function style {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[ValidateSet('render')] [String] ${Blocking},
		[String] ${Media},
		[String] ${Nonce},
		[ArgumentCompletions('text/css', 'text/tailwindcss')] [String] ${Type},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag style -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <sub> (subscript) element
#>
# EXPORTFUNC sub
function sub {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag sub -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <summary> (for <details) element
#>
# EXPORTFUNC summary
function summary {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag summary -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <sup> (superscript) element
#>
# EXPORTFUNC sup
function sup {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag sup -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <table> element
#>
# EXPORTFUNC table
function table {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag table -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <tbody> element
#>
# EXPORTFUNC tbody
function tbody {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag tbody -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <td> (table cell) element
#>
# EXPORTFUNC td
function td {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${ColSpan},
		[String] ${Headers},
		[String] ${RowSpan},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag td -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <template> (HTML fragment for templating in JS) element
#>
# EXPORTFUNC template
function template {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[ValidateSet('open', 'closed')] [String] ${ShadowRootMode},
		[String] ${ShadowRootClonable},
		[String] ${ShadowRootDelegatesFocus},
		[String] ${ShadowRootSerializable},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag template -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <textarea> (multi-line text input) element
#>
# EXPORTFUNC textarea
function textarea {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Cols},
		[String] ${DirName},
		[Switch] ${Disabled},
		[String] ${Form},
		[String] ${MaxLength},
		[String] ${MinLength},
		[String] ${Name},
		[String] ${Placeholder},
		[Switch] ${ReadOnly},
		[Switch] ${Required},
		[String] ${Rows},
		[ValidateSet('hard', 'soft', 'off')] [String] ${Wrap},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag textarea -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <tfoot> element
#>
# EXPORTFUNC tfoot
function tfoot {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag tfoot -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <th> element
#>
# EXPORTFUNC th
function th {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${Abbr},
		[String] ${ColSpan},
		[String] ${Headers},
		[String] ${RowSpan},
		[ValidateSet('row', 'col', 'rowgroup', 'colgroup')] [String] ${Scope},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag th -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <thead> element
#>
# EXPORTFUNC thead
function thead {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag thead -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <time> element
#>
# EXPORTFUNC time
function time {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[String] ${datetime},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag time -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <title> element
#>
# EXPORTFUNC title
function title {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag title -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <tr> element
#>
# EXPORTFUNC tr
function tr {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag tr -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <track> (for audio and video) element
#>
# EXPORTFUNC track
function track {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Default},
		[ValidateSet('subtitles', 'captions', 'chapters', 'metadata')] [String] ${Kind},
		[String] ${Label},
		[String] ${Src},
		[String] ${SrcLang},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag track -Attributes (_map_attributes $PSBoundParameters) -Void
}

<#
.SYNOPSIS
	HTML <u> (unarticulated annotation (previously underline)) element
#>
# EXPORTFUNC u
function u {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag u -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <ul> (unordered list) element
#>
# EXPORTFUNC ul
function ul {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag ul -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <var> (mathematical variable) element
#>
# EXPORTFUNC vartag
function vartag {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag var -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <video> element
#>
# EXPORTFUNC video
function video {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Autoplay},
		[Switch] ${Controls},
		[ValidateSet('nodownload', 'nofullscreen', 'noremoteplayback')] [String] ${ControlList},
		[ValidateSet('anonymous', 'use-credentials')] [String] ${CrossOrigin},
		[Switch] ${DisablePictureInPicture},
		[Switch] ${DisableRemotePlayback},
		[String] ${Height},
		[Switch] ${Loop},
		[Switch] ${Muted},
		[Switch] ${PlaysInline},
		[String] ${Poster},
		[ValidateSet('none', 'metadata', 'auto')] [String] ${Preload},
		[String] ${Src},
		[String] ${Width},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag video -Attributes (_map_attributes $PSBoundParameters) -InnerHTML $InnerHTML
}

<#
.SYNOPSIS
	HTML <wbr> (line break opportunity) element
#>
# EXPORTFUNC wbr
function wbr {
	param (
		

		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},

		[Hashtable] $Attributes
	)
	
	New-HTMLElement -Tag wbr -Attributes (_map_attributes $PSBoundParameters) -Void
}

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
		
		if ($Name -eq 'InnerHTML') {
			return
		}
		
		$Value = $Attributes[$Name].ToString()
		$Type = switch ($Attributes[$Name]) {
			($_.GetType() -eq [Switch]) { 'Switch' }
			default { 'String' }
		}
		
		# bug where manually specifying a switch like -Param:$False would still
		# render it, making it useless (the mere presence of HTML switches/
		# boolean attributes will activate them)
		if ($Attributes[$Name].GetType() -eq [Switch] -and $Value -ne 'True') {
			return
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
						Value=[System.Web.HttpUtility]::HtmlAttributeEncode($CustomAttrs[$_])
					})
				}
				
				return
			}
		}
		
		$Dict.Add($Name, [TypeAndValue]@{
			Type=$Type
			Value=[System.Web.HttpUtility]::HtmlAttributeEncode($Value)
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
			$Value = $Attributes[$AtName].Value
			$Type = $Attributes[$AtName].Type
			
			if ($AtName -cmatch '^(Aria[A-Z]|HttpEquiv$|Hx[A-Z])') {
				$FixedName = _pascal_to_kebab $AtName
			} else {
				$FixedName = $AtName.ToLower()
			}
			
			switch ($Type) {
				'Switch' {
					$HTML.Add( $FixedName )
				}
				
				{ $_ -in @('String', 'OptionalString') } {
					$HTML.Add( "$FixedName=""$Value""" )
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
		[String] ${AccessKey},
		[ValidateSet('none', 'off', 'sentences', 'on', 'words', 'characters')] [String] ${Autocapitalize},
		[ValidateSet('on', 'off')] [String] ${Autocorrect},
		[Switch] ${Autofocus},
		[String] ${Class},
		[ValidateSet('true', 'false', 'plaintext-only')] [String] ${ContentEditable},
		[ValidateSet('ltr', 'rtl', 'auto')] [String] ${Dir},
		[ValidateSet('true', 'false')] [String] ${Draggable},
		[ValidateSet('enter', 'done', 'go', 'next', 'previous', 'search', 'send')] [String] ${EnterKeyHint},
		[Switch] ${Hidden},
		[String] ${Id},
		[Switch] ${Inert},
		[ValidateSet('none', 'text', 'decimal', 'numeric', 'tel', 'search', 'email', 'url')] [String] ${InputMode},
		[String] ${ItemId},
		[String] ${ItemProp},
		[String] ${ItemRef},
		[Switch] ${ItemScope},
		[String] ${ItemType},
		[String] ${Lang},
		[ValidateSet('auto', 'hint', 'manual')] [String] ${Popover},
		[String] ${Slot},
		[ValidateSet('true', 'false')] [String] ${Spellcheck},
		[String] ${Style},
		[String] ${TabIndex},
		[String] ${Title},
		[ValidateSet('yes', 'no')] [String] ${Translate},
		[ValidateSet('auto', 'manual')] [String] ${VirtualKeyboardPolicy},
		[ValidateSet('true', 'false')] [String] ${WritingSuggestions},
		[String] ${Role},
		[ValidateSet('true', 'false')] [String] ${AriaHidden},
		[ValidateSet('ascending', 'descending', 'other')] [String] ${AriaSort},
		[String] ${AriaLabel},
		[String] ${HxGet},
		[String] ${HxPost},
		[ArgumentCompletions('true', 'false')] [String] ${HxPush-Url},
		[String] ${HxSelect},
		[String] ${HxSelect-Oob},
		[ArgumentCompletions('innerHTML', 'outerHTML', 'textContent', 'beforebegin', 'afterbegin', 'beforeend', 'afterend', 'delete', 'none')] [String] ${HxSwap},
		[String] ${HxSwap-Oob},
		[String] ${HxTarget},
		[String] ${HxTrigger},
		[String] ${HxVals},
		[ValidateSet('true', 'false')] [String] ${HxBoost},
		[String] ${HxConfirm},
		[String] ${HxDelete},
		[Switch] ${HxDisable},
		[String] ${HxDisabled-Elt},
		[String] ${HxDisinherit},
		[String] ${HxEncoding},
		[String] ${HxExt},
		[String] ${HxHeaders},
		[String] ${HxHistory},
		[String] ${HxHistory-Elt},
		[String] ${HxInclude},
		[String] ${HxIndicator},
		[String] ${HxInherit},
		[ValidateSet('*', 'none')] [String] ${HxParams},
		[String] ${HxPatch},
		[Switch] ${HxPreserve},
		[String] ${HxPrompt},
		[String] ${HxPut},
		[ArgumentCompletions('true', 'false')] [String] ${HxReplace-Url},
		[String] ${HxRequest},
		[ArgumentCompletions('drop', 'abort', 'replace', 'queue')] [String] ${HxSync},
		[ValidateSet('true', 'false')] [String] ${HxValidate},
		[String] ${HxVars},
		[String] ${_hs},
		[Switch] ${Async},
		[ValidateSet('render')] [String] ${Blocking},
		[ValidateSet('anonymous', 'use-credentials')] [String] ${CrossOrigin},
		[Switch] ${Defer},
		[ValidateSet('high', 'low', 'auto')] [String] ${FetchPriority},
		[String] ${Integrity},
		[Switch] ${NoModule},
		[String] ${Nonce},
		[ValidateSet('no-referrer', 'no-referrer-when-downgrade', 'origin', 'origin-when-cross-origin', 'same-origin', 'strict-origin', 'strict-origin-when-cross-origin', 'unsafe-url')] [String] ${ReferrerPolicy},
		[String] ${Src},
		[ArgumentCompletions('importmap', 'module', 'speculationrules', 'text/javascript', 'text/hyperscript')] [String] ${Type},


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
