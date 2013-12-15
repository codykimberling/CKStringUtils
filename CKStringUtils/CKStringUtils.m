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
    if([self isNil:string] || string.length == 0){
        return YES;
    }
    return NO;
}

#pragma mark - isNotEmpty:

+ (BOOL)isNotEmpty:(NSString *)string
{
    return ![self isEmpty:string];
}

#pragma mark - isBlank:

+ (BOOL)isBlank:(NSString *)string
{
    BOOL isEmpty = [self isEmpty:string];
    if(isEmpty){
        return YES;
    }
    
    return [self isEmpty:[self stringWithWhitespacesStripped:string]];
}

#pragma mark - isNotBlank:

+ (BOOL)isNotBlank:(NSString *)string
{
    return ![self isBlank:string];
}

#pragma mark - isWhitespace:

+ (BOOL)isWhitespace:(NSString *)string
{
    if([self isEmpty:string]){
        return NO;
    }
    return ([self stringWithWhitespacesStripped:string].length == 0);
}

#pragma mark - isAllLowerCase:

+ (BOOL)isAllLowerCase:(NSString *)string
{
    if([CKStringUtils isBlank:string]){
        return NO;
    }
    return ([string rangeOfCharacterFromSet:self.lowerCaseInvertedSet].location == NSNotFound);
}

#pragma mark - isAllUpperCase:

+ (BOOL)isAllUpperCase:(NSString *)string
{
    if([CKStringUtils isBlank:string]){
        return NO;
    }
    return ([string rangeOfCharacterFromSet:self.upperCaseInvertedSet].location == NSNotFound);
}

#pragma mark - isAlpha:

+ (BOOL)isAlpha:(NSString *)string
{
    if([CKStringUtils isBlank:string]){
        return NO;
    }
    
    return ([string rangeOfCharacterFromSet:self.lowerAndUpperCaseInvertedSet].location == NSNotFound);
}

#pragma mark - string: equalsString: ignoreCase:

+ (BOOL)string:(NSString *)string1 equalsString:(NSString *)string2 ignoreCase:(BOOL)ignoreCase
{
    if(string1 == string2){
        return YES;
    }
    
    if(ignoreCase){
        return [string1.lowercaseString isEqualToString:string2.lowercaseString];
    }
    
    return [string1 isEqualToString:string2];
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
    NSMutableCharacterSet *lowerAndUpperSet = self.lowerCaseSet.mutableCopy;
    [lowerAndUpperSet formUnionWithCharacterSet:self.upperCaseSet];
    
    return [lowerAndUpperSet invertedSet];
}



@end