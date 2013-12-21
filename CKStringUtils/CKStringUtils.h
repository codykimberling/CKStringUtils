//
//  CKStringUtils.h
//  CKStringUtils
//
//  Created by Cody Kimberling on 12/14/13.
//  Copyright (c) 2013 Cody Kimberling. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  ...
 */

@interface CKStringUtils : NSObject

#pragma mark - isNil:

/**
 *  Checks string value to determine if it is nil.
 *
 *  @param string string to check for nil
 *
 *  @return returns YES if nil, NO otherwise.
 */

+ (BOOL)isNil:(NSString *)string;

#pragma mark - isNotNil:

/**
 *  Checks string value to determine if it is not nil.
 *
 *  @param string string to check for nil
 *
 *  @return returns NO if nil, YES otherwise.
 */

+ (BOOL)isNotNil:(NSString *)string;

#pragma mark - isEmpty:

/**
 *  Checks for an empty value for string.
 *
 *  @param string string to check for emtpy value
 *
 *  @return returns YES is string is empty or nil, NO otherwise.
 */

+ (BOOL)isEmpty:(NSString *)string;

#pragma mark - isNotEmpty:

/**
 *  Checks for an empty value for string.
 *
 *  @param string string to check for emtpy value
 *
 *  @return returns NO is string is empty or nil, YES otherwise.
 */

+ (BOOL)isNotEmpty:(NSString *)string;

#pragma mark - isBlank:

/**
 *  Checks for a blank value for string.
 *
 *  @param string string to check for blank value
 *
 *  @return returns YES is string is nil, empty, or blank.  Returns NO otherwise.
 */

+ (BOOL)isBlank:(NSString *)string;

#pragma mark - isNotBlank:

/**
 *  Checks for a non-blank value for string.
 *
 *  @param string string to check for blank value
 *
 *  @return returns NO is string is nil, empty, or blank.  Returns YES otherwise.
 */

+ (BOOL)isNotBlank:(NSString *)string;

#pragma mark - isWhitespace:

/**
 *  Checks to see if string contains only whitespace.
 *
 *  @param string string to check
 *
 *  @return retruns YES if string only contains whitespace.  Returns NO otherwise.
 */

+ (BOOL)isWhitespace:(NSString *)string;

#pragma mark - isAllLowerCase:

/**
 *  Checks string to verify all characters are lower-case.
 *
 *  @param string string to check
 *
 *  @return returns YES if and only if every character in string is a lower-case value.  Returns NO otherwise.
 */

+ (BOOL)isAllLowerCase:(NSString *)string;

#pragma mark - isAllUpperCase:

/**
 *  Checks string to verify all characters are upper-case.
 *
 *  @param string string to check
 *
 *  @return returns YES if and only if every character in string is an upper-case value.  Returns NO otherwise.
 */

+ (BOOL)isAllUpperCase:(NSString *)string;

#pragma mark - isAlpha:

/**
 *  Checks string to verify all characters are alpha values.
 *
 *  @param string string to check
 *
 *  @return returns YES if and only if every character in string is an alpha value.  Returns NO otherwise.
 */

+ (BOOL)isAlpha:(NSString *)string;

#pragma mark - isNumeric:

/**
 *  Checks string to verify all characters are numeric values.
 *
 *  @param string string to check
 *
 *  @return returns YES if and only if every character in string is a numeric value.  Returns NO otherwise.
 */

+ (BOOL)isNumeric:(NSString *)string;

#pragma mark - isAlphanumeric:

/**
 *  Checks string to verify all characters are alphanumeric values.
 *
 *  @param string string to check
 *
 *  @return returns YES if and only if every character in string is an alphanumeric value.  Returns NO otherwise.
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
 *  @return returns YES if strings are equal (dependingon ignoreCase BOOL) or if both strings are nil.  Returns NO otherwise.
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
 *  @return returns YES if searchString is contained within string.  Returns NO otherwise.  If both strings nil, return YES.
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
 *  @return returns NO if searchString is contained within string.  Returns YES otherwise. If both strings nil, return NO.
 */

+ (BOOL)string:(NSString *)string doesNotContainString:(NSString *)searchString ignoreCase:(BOOL)ignoreCase;

#pragma mark - abbreviate: maxWidth

/**
 *  Abbreviates a String using ellipses. This will turn "abc123" into "abc..."
 *
 *  If string is less than maxWidth characters long, return it.<br />
 *  Else abbreviate it<br />
 *  If maxWidth is less than 4, return original String<br />
 *  In no case will it return a String of length greater than maxWidth.<br />
 *
 *  @param string   string to abbreviate
 *  @param maxWidth max width of abbreviated string
 *
 *  @return returns abbreviated string with ellipses
 */

+ (NSString *)abbreviate:(NSString *)string maxWidth:(int)maxWidth;

#pragma mark - defaultString: forString:

/**
 *  Returns either string or defaultString if string is nil.
 *
 *  @param defaultString default string
 *  @param string        string to check
 *
 *  @return returns defaultString if string is nil.  Returns nil if both arguments are nil.  Returns string otherwise.
 */

+ (NSString *)defaultString:(NSString *)defaultString forString:(NSString *)string;

#pragma mark - defaultStringIfEmpty: forString:

/**
 *  Returns either string or defaultString if string is nil or empty.
 *
 *  @param defaultString default string
 *  @param string        string to check
 *
 *  @return returns defaultString if string is nil or empty.  Returns nil if both arguments are nil.  Returns string otherwise.
 */

+ (NSString *)defaultStringIfEmpty:(NSString *)defaultString forString:(NSString *)string;

#pragma mark - defaultStringIfBlank: forString:

/**
 *  Returns either string or defaultString if string is nil, empty, or blank.
 *
 *  @param defaultString default string
 *  @param string        string to check
 *
 *  @return returns defaultString if string is nil, empty, or blank.  Returns nil if both arguments are nil.  Returns string otherwise.
 */

+ (NSString *)defaultStringIfBlank:(NSString *)defaultString forString:(NSString *)string;

@end
