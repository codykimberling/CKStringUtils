//
//  CKStringUtils.h
//  CKStringUtils
//
//  Created by Cody Kimberling on 12/14/13.
//  Copyright (c) 2013 Cody Kimberling. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Objective-C clone of Apache's StringUtils class (https://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/StringUtils.html)
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
 *  Checks for an empty value for string
 *
 *  @param string string to check for emtpy value
 *
 *  @return returns YES is string is empty or nil, NO otherwise.
 */

+ (BOOL)isEmpty:(NSString *)string;

#pragma mark - isNotEmpty:

/**
 *  Checks for an empty value for string
 *
 *  @param string string to check for emtpy value
 *
 *  @return returns NO is string is empty or nil, YES otherwise.
 */

+ (BOOL)isNotEmpty:(NSString *)string;

#pragma mark - isBlank:

/**
 *  Checks for a blank value for string
 *
 *  @param string string to check for blank value
 *
 *  @return returns YES is string is nil, empty, or blank.  Returns NO otherwise.
 */

+ (BOOL)isBlank:(NSString *)string;

#pragma mark - isNotBlank:

/**
 *  Checks for a non-blank value for string
 *
 *  @param string string to check for blank value
 *
 *  @return returns NO is string is nil, empty, or blank.  Returns YES otherwise.
 */

+ (BOOL)isNotBlank:(NSString *)string;

#pragma mark - isWhitespace

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
 *  Checks string to verify all characters are lower-case
 *
 *  @param string string to check
 *
 *  @return returns YES if and only if every character in string is a lower-case value.  Returns NO otherwise.
 */

+ (BOOL)isAllLowerCase:(NSString *)string;

#pragma mark - isAllUpperCase:

/**
 *  Checks string to verify all characters are upper-case
 *
 *  @param string string to check
 *
 *  @return returns YES if and only if every character in string is an upper-case value.  Returns NO otherwise.
 */

+ (BOOL)isAllUpperCase:(NSString *)string;

#pragma mark - isAlpha:

/**
 *  Checks string to verify all characters are alpha values
 *
 *  @param string stromg tp cjecl
 *
 *  @return returns YES if and only if every character in string is an alpha value.  Returns NO otherwise.
 */

+ (BOOL)isAlpha:(NSString *)string;

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

@end
