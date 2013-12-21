//
//  CKStringUtils.m
//  CKStringUtils
//
//  Created by Cody Kimberling on 12/14/13.
//  Copyright (c) 2013 Cody Kimberling. All rights reserved.
//

#import "CKStringUtils.h"

@implementation CKStringUtils

#pragma mark - isNil:

+ (BOOL)isNil:(NSString *)string
{
    return (string == nil);
}

#pragma mark - isNil:

+ (BOOL)isNotNil:(NSString *)string
{
    return ![self isNil:string];
}

#pragma mark - isEmpty:

+ (BOOL)isEmpty:(NSString *)string
{
    return ([self isNil:string] || string.length == 0);
}

#pragma mark - isNotEmpty:

+ (BOOL)isNotEmpty:(NSString *)string
{
    return ![self isEmpty:string];
}

#pragma mark - isBlank:

+ (BOOL)isBlank:(NSString *)string
{
    return ([self isEmpty:string]) ? YES : [self isEmpty:[self stringWithWhitespacesStripped:string]];
}

#pragma mark - isNotBlank:

+ (BOOL)isNotBlank:(NSString *)string
{
    return ![self isBlank:string];
}

#pragma mark - isWhitespace:

+ (BOOL)isWhitespace:(NSString *)string
{
    return [self isEmpty:string] ? NO : ([self stringWithWhitespacesStripped:string].length == 0);
}

#pragma mark - isAllLowerCase:

+ (BOOL)isAllLowerCase:(NSString *)string
{
    return [CKStringUtils isBlank:string] ? NO : ([string rangeOfCharacterFromSet:self.lowerCaseInvertedSet].location == NSNotFound);
}

#pragma mark - isAllUpperCase:

+ (BOOL)isAllUpperCase:(NSString *)string
{
    return [CKStringUtils isBlank:string] ? NO : ([string rangeOfCharacterFromSet:self.upperCaseInvertedSet].location == NSNotFound);
}

#pragma mark - isAlpha:

+ (BOOL)isAlpha:(NSString *)string
{
    return [CKStringUtils isBlank:string] ? NO : ([string rangeOfCharacterFromSet:self.lowerAndUpperCaseInvertedSet].location == NSNotFound);
}

#pragma mark - isNumeric:

+ (BOOL)isNumeric:(NSString *)string
{
    return [CKStringUtils isBlank:string] ? NO : ([string rangeOfCharacterFromSet:self.decimalDigitInvertedCharacterSet].location == NSNotFound);
}

#pragma mark - isAlphanumeric:

+ (BOOL)isAlphaNumeric:(NSString *)string
{
    return [CKStringUtils isBlank:string] ? NO : ([string rangeOfCharacterFromSet:self.alphaNumericInvertedCharacterSet].location == NSNotFound);
}

#pragma mark - string: containsString:

+ (BOOL)string:(NSString *)string containsString:(NSString *)searchString
{
    if([self isNil:string] && [self isNil:searchString]){
        return YES;
    }
    
    if([self isNil:string] || [self isNil:searchString]){
        return NO;
    }
    
    return !([string rangeOfString:searchString].location == NSNotFound);
}

#pragma mark - string: doesNotContainString:

+ (BOOL)string:(NSString *)string doesNotContainString:(NSString *)searchString
{
    return ![self string:string containsString:searchString];
}

#pragma mark - string: equalsString: ignoreCase:

+ (BOOL)string:(NSString *)string1 equalsString:(NSString *)string2 ignoreCase:(BOOL)ignoreCase
{
    if(string1 == string2){
        return YES;
    }
    
    return ignoreCase ? [string1.lowercaseString isEqualToString:string2.lowercaseString] : [string1 isEqualToString:string2];
}

#pragma mark - abbreviate: maxWidth:

+ (NSString *)abbreviate:(NSString *)string maxWidth:(int)maxWidth
{
    NSString *ellipses = @"...";
    
    if([self isNil:string]){
        return nil;
    }
    
    if([self isEmpty:string]){
        return @"";
    }
    
    if(maxWidth <= ellipses.length){
        return string;
    }
    
    if(string.length > maxWidth){
        NSString *abbreviatedString = [string substringToIndex:(maxWidth - ellipses.length)];
        return [NSString stringWithFormat:@"%@%@", abbreviatedString, ellipses];
    }
    return string;
}

#pragma mark - Helpers

+ (NSString *)stringWithWhitespacesStripped:(NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+ (NSCharacterSet *)lowerCaseInvertedSet
{
    return [NSCharacterSet.lowercaseLetterCharacterSet invertedSet];
}

+ (NSCharacterSet *)upperCaseInvertedSet
{
    return  [NSCharacterSet.uppercaseLetterCharacterSet invertedSet];
}

+ (NSCharacterSet *)lowerCaseSet
{
    return NSCharacterSet.lowercaseLetterCharacterSet;
}

+ (NSCharacterSet *)upperCaseSet
{
    return  NSCharacterSet.uppercaseLetterCharacterSet;
}

+ (NSCharacterSet *)lowerAndUpperCaseSet
{
    NSMutableCharacterSet *lowerAndUpperSet = self.lowerCaseSet.mutableCopy;
    [lowerAndUpperSet formUnionWithCharacterSet:self.upperCaseSet];
    
    return lowerAndUpperSet;
}

+ (NSCharacterSet *)lowerAndUpperCaseInvertedSet
{
    return [self.lowerAndUpperCaseSet invertedSet];
}

+ (NSCharacterSet *)decimalDigitCharacterSet
{
    return  NSCharacterSet.decimalDigitCharacterSet;
}

+ (NSCharacterSet *)decimalDigitInvertedCharacterSet
{
    return  [NSCharacterSet.decimalDigitCharacterSet invertedSet];
}

+ (NSCharacterSet *)alphaNumericCharacterSet
{
    NSMutableCharacterSet *alphaNumericSet = self.lowerAndUpperCaseSet.mutableCopy;
    [alphaNumericSet formUnionWithCharacterSet:self.decimalDigitCharacterSet];
    
    return alphaNumericSet;
}

+ (NSCharacterSet *)alphaNumericInvertedCharacterSet
{
    return [self.alphaNumericCharacterSet invertedSet];
}

@end