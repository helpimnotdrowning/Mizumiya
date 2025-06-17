Mizumiya is a mostly-in-place-compatible alternative to the wonderful
[PSHTML](https://github.com/Stephanevg/PSHTML); it is a PowerShell DSL to more
easily write HTML documents, either for general use or for use in frameworks
like [Pode](https://github.com/badgerati/pode).

<img align="center" alt="Logo" src="branding/mizumiya.png">

<sup>(despite the logo being in Japanese, everything else is in English. Sorry!)
</sup>

The reasons for creating this project are, in chronological order,
1. Lack of some common or global attributes on commands, which needed lots of
messy-looking `-Attr @{ ... }` to do things I wanted to do
2. Lack of the `<video>` element command (possibly among others, I haven't
checked)
3. Sudden appearance of free time
4. Finally and partially, discovering that PSHTML is itself not GPL-compatible
<sup>[How so?](#not-gpl-compatible)</sup>

In this re-implementation, I have only kept the features I deemed necessary,
being the element commands and a few utilities. Things like templates, colors,
the config/asset manager, and charts were stripped away.

While this was originally meant to be a drop-in replacement, a few things have
changed that might break/will things or subvert expectations:
* Parameter order has changed. If you use ordered parameters like in the PSHTML
README, `link "css/normalize.css" "stylesheet"`, then you might encounter issues
with values going in places you aren't expecting. Instead, you should always be
using named parameters: `link -href "css/normalize.css" -rel "stylesheet"`

* Some more parameters now have enforced value sets. In all honesty, I haven't
really checked the differences, but there are almost certainly places where
Mizumiya and PSHTML will differ.

* Some parameters will suggest values, but not require them. For example, PSHTML
forces `<script>`'s `-Type` to only `text/javascript` and `<a>`/`<area>`/
`<form>`/`<link>`'s `-Rel` into a certain set of values by using
`[ValidateSet(...)]`. In Mizumiya, certain parameters instead use
`[ArgumentCompletions(...)]` to suggest (but not enforce!) a set of values.

* All elements now come with global attributes, ARIA attributes, and HTMX
attributes. (HTMX is implemented, ARIA is partially there)

All attributes, their types, and their acceptable values were manually gleaned
from Mozilla's MDN docs. I have almost certainly forgotten or overlooked some
attributes or their acceptable values, and maybe an even an element.

---

#### Not GPL compatible?
The PSHTML license at first appears to be the standard MIT license. On closer
inspection, a pair of commits (
[531e680: Update LICENSE](https://github.com/Stephanevg/PSHTML/commit/531e680613cd16d77c9d929a530864cb394d1980)
and a little bit of
[5c39db9: Update LICENSE](https://github.com/Stephanevg/PSHTML/commit/5c39db936a5cf265a5bb8be8dd3fc7ee2042a6cb)
) removes the right for commerical use. This is required for the library to be
relicenseable to the GPL, and, to my understanding, usable in GPL projects.
<sup>(and
even if I have ended up horifically misunderstanding how licences interact, I
still wanted to have some fun writing this!)</sup>

#### Extra: branding
See [branding/README.md](branding/README.md)
