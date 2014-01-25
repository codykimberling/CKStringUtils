//
//  CKStringUtils.h
//  CKStringUtils
//
//  Created by Cody Kimberling on 12/14/13.
//  Copyright (c) 2013 Cody Kimberling. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  A NSString utility class to help make working with NSStrings a little easier.
 *
 *  *  An __empty string__ is either a nil value of a 0-length string.
 *
 *  *  A __blank string__ is either an empty string of a string which contains 1 or more non-whitespace characters.
 *
 */

@interface CKStringUtils : NSObject

#pragma mark - isNil:

/**
 *  Checks string value to determine if it is nil.
 *
 *  @param string string to check for nil
 *
 *  @return Returns YES if nil, NO otherwise.
 */

+ (BOOL)isNil:(NSString *)string;

#pragma mark - isNotNil:

/**
 *  Checks string value to determine if it is not nil.
 *
 *  @param string string to check for nil
 *
 *  @return Returns NO if nil, YES otherwise.
 */

+ (BOOL)isNotNil:(NSString *)string;

#pragma mark - isEmpty:

/**
 *  Checks for an empty value for string.
 *
 *  @param string string to check for emtpy value
 *
 *  @return Returns YES is string is empty or nil, NO otherwise.
 */

+ (BOOL)isEmpty:(NSString *)string;

#pragma mark - isNotEmpty:

/**
 *  Checks for an empty value for string.
 *
 *  @param string string to check for emtpy value
 *
 *  @return Returns NO is string is empty or nil, YES otherwise.
 */

+ (BOOL)isNotEmpty:(NSString *)string;

#pragma mark - isBlank:

/**
 *  Checks for a blank value for string.
 *
 *  @param string string to check for blank value
 *
 *  @return Returns YES is string is nil, empty, or blank.  Returns NO otherwise.
 */

+ (BOOL)isBlank:(NSString *)string;

#pragma mark - isNotBlank:

/**
 *  Checks for a non-blank value for string.
 *
 *  @param string string to check for blank value
 *
 *  @return Returns NO is string is nil, empty, or blank.  Returns YES otherwise.
 */

+ (BOOL)isNotBlank:(NSString *)string;

#pragma mark - isAllLowerCase:

/**
 *  Checks string to verify all characters are lower-case.
 *
 *  @param string string to check
 *
 *  @return Returns YES if and only if every character in string is a lower-case value.  Returns NO otherwise.
 */

+ (BOOL)isAllLowerCase:(NSString *)string;

#pragma mark - isAllUpperCase:

/**
 *  Checks string to verify all characters are upper-case.
 *
 *  @param string string to check
 *
 *  @return Returns YES if and only if every character in string is an upper-case value.  Returns NO otherwise.
 */

+ (BOOL)isAllUpperCase:(NSString *)string;

#pragma mark - isAlpha:

/**
 *  Checks string to verify all characters are alpha values.
 *
 *  @param string string to check
 *
 *  @return Returns YES if and only if every character in string is an alpha value.  Returns NO otherwise.
 */

+ (BOOL)isAlpha:(NSString *)string;

#pragma mark - isNumeric:

/**
 *  Checks string to verify all characters are numeric values.
 *
 *  @param string string to check
 *
 *  @return Returns YES if and only if every character in string is a numeric value.  Returns NO otherwise.
 */

+ (BOOL)isNumeric:(NSString *)string;

#pragma mark - isAlphanumeric:

/**
 *  Checks string to verify all characters are alphanumeric values.
 *
 *  @param string string to check
 *
 *  @return Returns YES if and only if every character in string is an alphanumeric value.  Returns NO otherwise.
 */

+ (BOOL)isAlphaNumeric:(NSString *)string;

#pragma mark - string: equalsString: ignoreCase:

/**
 *  Compares strings for equality
 *
 *  @param string1    first string
 *  @param string2    second string
 *  @param ignoreCase YES to case-insensitive compare strings
 *
 *  @return Returns YES if strings are equal (dependingon ignoreCase BOOL) or if both strings are nil.  Returns NO otherwise.
 */

+ (BOOL)string:(NSString *)string1 equalsString:(NSString *)string2 ignoreCase:(BOOL)ignoreCase;

#pragma mark - string: containsString: ignoreCase:

/**
 *  Checks string to verify that search string is contained within it
 *
 *  @param string       string to search
 *  @param searchString search string
 *  @param ignoreCase   YES to case-insensitive compare strings
 *
 *  @return Returns YES if searchString is contained within string.  Returns NO otherwise.  If both strings nil, return YES.
 */

+ (BOOL)string:(NSString *)string containsString:(NSString *)searchString ignoreCase:(BOOL)ignoreCase;

#pragma mark - string: doesNotContainString: ignoreCase:

/**
 *  Checks string to verify that search string is not contained within it
 *
 *  @param string       string to search
 *  @param searchString search string
 *  @param ignoreCase   YES to case-insensitive compare strings
 *
 *  @return Returns NO if searchString is contained within string.  Returns YES otherwise. If both strings nil, return NO.
 */

+ (BOOL)string:(NSString *)string doesNotContainString:(NSString *)searchString ignoreCase:(BOOL)ignoreCase;

#pragma mark - defaultString: forString:

/**
 *  Returns either string or defaultString if string is nil.
 *
 *  @param defaultString default string
 *  @param string        string to check
 *
 *  @return Returns defaultString if string is nil.  Returns nil if both arguments are nil.  Returns string otherwise.
 */

+ (NSString *)defaultString:(NSString *)defaultString forString:(NSString *)string;

#pragma mark - defaultStringIfEmpty: forString:

/**
 *  Returns either string or defaultString if string is empty.
 *
 *  @param defaultString default string
 *  @param string        string to check
 *
 *  @return Returns defaultString if string is empty.  Returns nil if both arguments are nil.  Returns string otherwise.
 */

+ (NSString *)defaultStringIfEmpty:(NSString *)defaultString forString:(NSString *)string;

#pragma mark - defaultStringIfBlank: forString:

/**
 *  Returns either string or defaultString if string is blank.
 *
 *  @param defaultString default string
 *  @param string        string to check
 *
 *  @return Returns defaultString if string is blank.  Returns nil if both arguments are nil.  Returns string otherwise.
 */

+ (NSString *)defaultStringIfBlank:(NSString *)defaultString forString:(NSString *)string;

#pragma mark - abbreviate: maxWidth

/**
 *  Abbreviates a string using ellipses. This will turn "abc123" into "abc..."
 *
 *  If string is less than maxWidth characters long, return it.<br />
 *  Else abbreviate it<br />
 *  If maxWidth is less than 4, return original string<br />
 *  In no case will it return a string of length greater than maxWidth.<br />
 *
 *  @param string   string to abbreviate
 *  @param maxWidth max width of abbreviated string
 *
 *  @return Returns abbreviated string with ellipses
 */

+ (NSString *)abbreviate:(NSString *)string maxWidth:(int)maxWidth;

#pragma mark - isValidEmailAddress:

/**
 *  Tests a string to determine if it is a valid email address
 *
 *  @param emailAddress email address to verify
 *
 *  @return YES if valid email address, NO otherwise
 */

+ (BOOL)isValidEmailAddress:(NSString *)emailAddress;

#pragma mark stringByTrimmingLeadingWhitespaceCharactersInString:

/**
 *  Returns a NSString with leading space trimmed
 *
 *  @param string String to trim
 *
 *  @return Returns trimmed string (leading spaces).  If string is empty or nil, return string.
 */

+ (NSString *)stringByTrimmingLeadingWhitespaceCharactersInString:(NSString *)string;

#pragma mark stringByTrimmingTrailingWhitespaceCharactersInString

/**
 *  Returns a NSString with trailing space trimmed
 *
 *  @param string String to trim
 *
 *  @return Returns trimmed string (trailing spaces).  If string is empty or nil, return string.
 */

+ (NSString *)stringByTrimmingTrailingWhitespaceCharactersInString:(NSString *)string;

#pragma mark stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:

/**
 *  Returns a NSString with leading and trailing space trimmed
 *
 *  @param string String to trim
 *
 *  @return Returns trimmed string (leading and trailing spaces).  If string is empty or nil, return string.
 */

+ (NSString *)stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:(NSString *)string;

#pragma mark stringByUrlEscapingString:

/**
 *  Returns a URL escaped version of the string argument
 *
 *  @param string string to escape
 *
 *  @return If blank, return string otherwise return URL escaped version of the string.
 */

+ (NSString *)stringByUrlEscapingString:(NSString *)string;

@end