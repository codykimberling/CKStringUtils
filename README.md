CKStringUtils
=============

#### A utilitiy class to help make working with NSStrings a little easier.

### Adding CKStringUtils to your project

Install via Cocoapods, add a line like the one below, in your Podfile:

`pod 'CKStringUtils', '~> 1.0.0'`

Alternatively, clone this repository and add CKStringUtils.h and CKStringUtils.m to your project

### Source code documentation

This source includes class docs, which can be incorporated into Xcode or Dash by:


*  If you don't already have appledoc installed, install it with `homebrew by typing brew install appledoc`.
*  Install the documentation into Xcode by executing the ` generate_appledoc.sh` script.
*  Restart Xcode if it's already running or locate the docset using Dash.

### What it does

*  An empty string is either a nil value of a 0-length string.

*  A blank string is either an empty string of a string which contains 1 or more non-whitespace characters.

__Class Methods:__

	+ isNil:
	+ isNotNil:
	+ isEmpty:
	+ isNotEmpty:
	+ isBlank:
	+ isNotBlank:
	+ isAllLowerCase:
	+ isAllUpperCase:
	+ isAlpha:
	+ isNumeric:
	+ isAlphaNumeric:
	+ string:equalsString:ignoreCase:
	+ string:containsString:ignoreCase:
	+ string:doesNotContainString:ignoreCase:
	+ defaultString:forString:
	+ defaultStringIfEmpty:forString:
	+ defaultStringIfBlank:forString:
	+ abbreviate:maxWidth:

### License

This code is distributed under the terms and conditions of the MIT license.
