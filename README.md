Mizumiya is a mostly-in-place-compatible alternative to the wonderful
[PSHTML](https://github.com/Stephanevg/PSHTML); it is a PowerShell DSL to more
easily write HTML documents, either for general use or for use in frameworks
like [Pode](https://github.com/badgerati/pode).

<img align="center" alt="Logo" src="branding/mizumiya.png">

<sup>(despite the logo being in Japanese, everything else is in English. Sorry!)</sup>

Blog post with a general overview (my first post!!):
https://www.helpimnotdrowning.net/sayings/making-of-mizumiya

And a small pile of branding assets are availabe listed in
[branding/README.md](branding/README.md)

---

You can think of Mizumiya as a stripped-down, then extended, re-implementation
of PSHTML. I have only kept the features I deemed necessary: the tag commands
and a few utilities --  things like templates, colors, the config/asset manager,
and charts were removed.

While this was originally meant to be a drop-in replacement, a few things have
changed that might/will break things or subvert expectations:
* Parameter order has changed. If you use ordered parameters like in the PSHTML
README (ex.`link "css/normalize.css" "stylesheet"`), then you might encounter
issues with values going in places you aren't expecting. Instead, you should
always be using named parameters:
`link -Href "css/normalize.css" -Rel "stylesheet"`

* Some more parameters now have enforced value sets. In all honesty, I haven't
really checked the differences, but there are almost certainly places where
Mizumiya and PSHTML will differ.

* Some parameters will suggest values, but not require them. For example, PSHTML
forces `<script>`'s `-Type` to only `text/javascript` and `<a>`/`<area>`/
`<form>`/`<link>`'s `-Rel` into a certain set of values by using
`[ValidateSet(...)]`. In Mizumiya, certain parameters instead use
`[ArgumentCompletions(...)]` to suggest (but not enforce!) a set of values.

* All elements now come with the global, ARIA, and HTMX attributes.

All attributes, their types, and their acceptable values were manually gleaned
from Mozilla's MDN docs. There is a chance that I've forgotten or overlooked
some atttributes or their acceptable values, and as the HTML Living Standard
grows, attributes will be missing. Feel free to open an issue or pull request!

## Installation
Mizumiya is currently not on the PowerShell Gallery. You can install it now by
downloading or cloning this repo, copying the inner [`Mizumiya/`](Mizumiya/) directory, and dropping it somewhere in your `$env:PSModulePath`.

## Usage
You can use Mizumiya similar to how you would write a normal HTML document:
```pwsh
Import-Module Mizumiya

doctype

html -Lang en {
	head {
		title "Example Page"
		
		script -Src 'https://unpkg.com/jquery@3.7.1/dist/jquery.slim.min.js'
		script -Src '/assets/index.js'
	}
	
	comment "something nice..."
	
	body {
		"text here, or "
		a -Href 'https://www.youtube.com/watch?v=C6RvwUsCFfw' { "go somewhere else!" }
	}
}
```
creates <sup>(after formatting)</sup>:
```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Example Page</title>
		<script src="https://unpkg.com/jquery@3.7.1/dist/jquery.slim.min.js"></script>
		<script src="/assets/index.js" ></script>
	</head>
	<!-- something nice... -->
	<body>
		text here, or <a href="https://www.youtube.com/watch?v=C6RvwUsCFfw">go somewhere else!</a>
	</body>
</html>
```

## Extending Mizumiya
Creating a new element command for use externally (not distributed with
Mizumiya) is very simple. Consider the following abbreviated implementations of
`<a>` and `<img>`:
```pwsh
function a {
	param (
		[Parameter(ValueFromPipeline)]
		$InnerHTML,
		
		[String] $Href,
		[Switch] $Download,
		[String] $Id,
		[String] $Class
	)
	
	return (New-HTMLElement -Tag a -Attributes $PSBoundParameters -InnerHTML $InnerHTML)
}

function img {
	param (
		[String] $Src,
		[String] $Width,
		[String] $Height,
		[ValidateSet('eager', 'lazy')] [String] $Loading
	)
	
	return (New-HTMLElement -Tag img -Attributes $PSBoundParameters -Void)
}
```


### Directly Extending
For **directly** extending Mizumiya using the `_new_tag` helper:

`_new_tag` uses what is essentially a mini "DSL" to source-gen the module code.
This is so functions can avoid the repitition needed to support the large amount
of HTML global attributes, the WAI-ARIA attributes, and the
[HTMX](https://htmx.org/) attribute set (a personal choice).

Since the helper is defined in [ElementGenerator.ps1](ElementGenerator.ps1) and
is not exported, you must modify that file. This is the syntax of `_new_tag`:
```pwsh
_new_tag ${HTML tag name} -Help ${Help text} -Params @(
	# for HTML "booleans" that only need to be present to activate them, use:
	@( ${Parameter name}, "Switch" )
	# for attributes with no value restrictions, use:
	@( ${Parameter name}, "String" )
	# for String: attr values that must belong in some strict set, or OptionalString: suggesting (but not enforcing!) a loose set of values, use:
	@( ${Parameter name}, "String", @(
		<List of values>)
	)
	# or:
	@( ${Parameter name}, "OptionalString", @(
		<List of values>)
	)
)
```

### Indirectly Extending
Follow these next points to create a similar function, **indirectly**
extending Mizumiya:

* The first parameter of non-[void elements](https://developer.mozilla.org/docs/Glossary/Void_element) should be a type-less `$InnerHTML`. This lets a positional
parameter (parameter with no label), like a final scriptblock or loose string be
assigned to it, which can be more convenient (and aesthetically pleasing) than
manually assigning it:
```pwsh
# this... (manual)
a -Href 'https://www.youtube.com/watch?v=C6RvwUsCFfw' -InnerHTML "Go somewhere else!"
# or this? (positional)
a -Href 'https://www.youtube.com/watch?v=C6RvwUsCFfw' { "Go somewhere else!" }
a -Href 'https://www.youtube.com/watch?v=C6RvwUsCFfw' {
	"Go somewhere else!"
}
```
```html
<a href="https://google.com">Go somewhere else!</a>
```

* Void elements should toggle `New-HTMLElement`'s `-Void` switch to use the
correct ending tag and prevent incorrect use by accidentally setting its inner
HTML.
```pwsh
img -Src /assets/banner.png -Height 100
```
```html
<img src="/assets/banner.png" height="100" />
```

* The function must be annotated with `[CmdletBinding()]`! This prevents some
sillyness with functions silently accepting non-existant parameters in certain
circumstances.

* The function should use `[ValidateSet(...)]` (for strict sets) or
`[ArgumentCompletions(...)]` (for loose sets) to validateparameter values.

* It can include a `[Hashtable] $Attributes` parameter. This is a
specially-cased parameter name that, when passed *within* the hashtable passed
to `New-HTMLElement` (like through `$PSBoundParameters`), allows users to add
extra attributes that you have not defined. Attributes passed this way will not
be specially processed apart from the usual name lowercasing and value encoding;
in other words...
```pwsh
New-HTMLElement <# ... #> -Attributes @{
	<# ... #>
	Attributes = @{
		'custom-attributes-in-here' = '...'
		<# ... #>
	}
}
```

* If you want your function parameters to directly become your attributes, pass
your `$PSBoundParameters` directly to `New-HTMLElement`'s `Attributes`
parameter. That being said...

* You must properly name your parameters! Some parameters, like the Aria* and Hx*
sets (and HttpEquiv), are specially-cased for ease of use by inserting a hyphen
before the second word, marked by the second capital letter in the name. To
replicate this, do one of the following:
	1. Your parameters must have the hypens included in the name, like
	`${Attr-Name}`. Note that the name is surrounded in braces: hyphens are
	"special characters" and aren't allowed in naked definitions like you would
	usually use
	2. Your parameters must be preprocessed within your function. You can use
	the following code block to do this like in Mizumiya, which only hyphenates
	the second word. If you want to hyphenate *all* words, remove the
	`$IsFirstCapital` bits.
```pwsh
$IsFirstCapital = $true
$FixedName = $BadName -replace "^.", { $_.Value.ToLower() } -creplace "[A-Z]", {
	if ($IsFirstCapital) {
		"-" + $_.Value.ToLower(); $IsFirstCapital = $false
	} else {
		$_.Value.ToLower()
	}
}
```
