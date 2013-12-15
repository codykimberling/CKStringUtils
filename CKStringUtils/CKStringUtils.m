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
    
    NSString *stringWithWhitespaceReplaced = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return [self isEmpty:stringWithWhitespaceReplaced];
}

#pragma mark - isNotBlank:

+ (BOOL)isNotBlank:(NSString *)string
{
    return ![self isBlank:string];
}

#pragma mark - string: equalsString:

+ (BOOL)string:(NSString *)string1 equalsString:(NSString *)string2
{
    if([self isNil:string1] && [self isNil:string2]){
        return YES;
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

@end