# Esoteric Foundation Logo

[![Project status: maintained][status]][root]

The official logo of the [Esoteric Foundation][author].

This repository contains an [Asymptote][asymptote-website] script ([`logo.asy`][logo-script]) that provides a way to generate different variants of the logo by using [Asymptote][asymptote-website]'s `-user` input [command line option][asymptote-cli-options].

See [`build.sh`][build-script] for inputs to the script that generate all official variants of the logo.

## Requirements

- [Asymptote][asymptote-website]

## Usage

Run the [script][logo-script] by using the command `asy logo`.

See [Asymptote command line options][asymptote-cli-options], run `asy -h` or see [`build.sh`][build-script] for more options to customise the logo output.

### User Input

The `-u` (or `-user`) [command line option][asymptote-cli-options] can be used to run arbitrary [Asymptote][asymptote-website] code provided by the user running the script.

The [logo script][logo-script] takes advantage of this feature by defining [variables](#variables) that the user can change. See [`build.sh`][build-script] for examples.

#### Variables

| Variable         | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `type`           | Specifies which features, if any, should be generated with the base logo.  Accepted values:<br><br>&centerdot; `"circle"` - generates a circle with its center being the center of the small square. The circle is the same distance from each of the main triangles $3$ points.<br>&centerdot; `"square-centered"` - generates a square with its center being the center of the small square.<br>&centerdot; `"square-equidistant"` - generates a square such that the main polygon is equidistant to the top and bottom and to the left and right sides of the square.<br>&centerdot; other/unspecified - only generates the base logo. |
| `borderDistance` | Controls how far away the border (see the `type` variable) is from the polygon.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |

## Releases

All official variants of the logo can be found in image form on the [releases][releases] page on GitHub. Releases may or may not be up-to-date with the logo source code.

## Supported Image Formats

The following image formats for the logo are officially supported:

- [`svg`][svg]
- [`png`][png]

These formats are used because they provide the highest quality for the logo image.

> [!NOTE]
> [`svg`][svg] versions of the logo should be used where possible as the logo is a [vector image][vector-images] and the [`svg`][svg] format specialises in handling [vector graphics][vector-images].

## Credit

### [Asymptote][asymptote]

<sup>[&copy; 2004-2025][asymptote-copyright] [Andy Hammerlindl][andy-hammerlindl], [John C. Bowman][john-bowman] and [Tom Prince][tom-prince]</sup>\
<sup>By [Andy Hammerlindl][andy-hammerlindl], [John C. Bowman][john-bowman], [Tom Prince][tom-prince] and [Asymptote contributors][asymptote-contributors]</sup>\
<sup>[Licensed][asymptote-license-notice] under the [LGPL 3.0][asymptote-license] or later</sup>

## License

&copy; 2024-2025 [Esoteric Foundation][author]

[Esoteric Foundation Logo][root] is licensed under the [AGPL 3.0][license] only.

<!-- Link aliases -->

[root]: /

[author]: https://esoteric.foundation
[license]: ../LICENSE
[releases]: https://github.com/esotericfoundation/logo/releases

<!-- References -->

[svg]: https://en.wikipedia.org/wiki/SVG
[png]: https://en.wikipedia.org/wiki/PNG
[vector-images]: https://en.wikipedia.org/wiki/Vector_graphics

<!-- Credit -->

<!-- Asymptote -->

[asymptote]: https://github.com/vectorgraphics/asymptote/tree/3.02git
[asymptote-website]: https://asymptote.sourceforge.io/
[asymptote-cli-options]: https://asymptote.sourceforge.io/asymptote.pdf#Options
[andy-hammerlindl]: https://ahammerl.github.io/
[john-bowman]: http://www.math.ualberta.ca/~bowman/
[tom-prince]: https://www.linkedin.com/in/tom-prince/
[asymptote-contributors]: https://github.com/vectorgraphics/asymptote/graphs/contributors
[asymptote-copyright]: https://github.com/vectorgraphics/asymptote/blob/3.02git/README#L2
[asymptote-license-notice]: https://github.com/vectorgraphics/asymptote/blob/3.02git/README#L22
[asymptote-license]: https://github.com/vectorgraphics/asymptote/blob/3.02git/LICENSE.LESSER

<!-- Files -->

<!-- Scripts -->

[logo-script]: ../logo.asy
[build-script]: ../scripts/build.sh

<!-- Badges -->

[status]: ./assets/images/badges/status.svg
