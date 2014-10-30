//
//  CKStringUtilsTests.m
//  CKStringUtilsTests
//
//  Created by Cody Kimberling on 12/14/13.
//  Copyright (c) 2013 Cody Kimberling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CKStringUtils.h"

@interface CKStringUtils (TestHelper)

+ (NSString *)illegalCharaterSet;
+ (BOOL)doesStringContainIllegalUrlCharacters:(NSString *)string;

@end

@interface CKStringUtilsTests : XCTestCase

@property (nonatomic) id nsNull;
@property (nonatomic) NSString *nilString;
@property (nonatomic) NSString *blankString;
@property (nonatomic) NSString *emptyString;

@end

@implementation CKStringUtilsTests

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    
    self.nsNull = NSNull.null;
    self.nilString = nil;
    self.emptyString = @"";
    self.blankString = @" ";
}

#pragma mark - isNil: isNotNil:

- (void)testIsNil_nil
{
    XCTAssertTrue([CKStringUtils isNil:self.nsNull]);
    XCTAssertTrue([CKStringUtils isNil:self.nilString]);
    XCTAssertFalse([CKStringUtils isNotNil:self.nilString]);
}

- (void)testIsNil_blank
{
    XCTAssertFalse([CKStringUtils isNil:self.blankString]);
    XCTAssertTrue([CKStringUtils isNotNil:self.blankString]);
}

- (void)testIsNil
{
    XCTAssertFalse([CKStringUtils isNil:@"string"]);
    XCTAssertTrue([CKStringUtils isNotNil:@"string"]);
}

#pragma mark - isEmpty: isNotEmpty

- (void)testIsEmpty_nil
{
    XCTAssertTrue([CKStringUtils isEmpty:self.nsNull]);
    XCTAssertTrue([CKStringUtils isEmpty:self.nilString]);
    XCTAssertFalse([CKStringUtils isNotEmpty:self.nilString]);
}

- (void)testIsEmpty_blankString
{
    XCTAssertFalse([CKStringUtils isEmpty:self.blankString]);
    XCTAssertTrue([CKStringUtils isNotEmpty:self.blankString]);
}

- (void)testIsEmpty_emptyString
{
    XCTAssertTrue([CKStringUtils isEmpty:self.emptyString]);
    XCTAssertFalse([CKStringUtils isNotEmpty:self.emptyString]);
}

- (void)testIsEmpty_stringWithWhitespace
{
    XCTAssertFalse([CKStringUtils isEmpty:@"  test  "]);
    XCTAssertTrue([CKStringUtils isNotEmpty:@"  test  "]);
}

- (void)testIsEmpty
{
    XCTAssertFalse([CKStringUtils isEmpty:@"test"]);
    XCTAssertTrue([CKStringUtils isNotEmpty:@"test"]);
}

#pragma mark - isBlank: isNotBlank

- (void)testIsBlank_nil
{
    XCTAssertTrue([CKStringUtils isBlank:self.nsNull]);
    XCTAssertTrue([CKStringUtils isBlank:self.nilString]);
    XCTAssertFalse([CKStringUtils isNotBlank:self.nilString]);
}

- (void)testIsBlank_blank
{
    XCTAssertTrue([CKStringUtils isBlank:self.blankString]);
    XCTAssertFalse([CKStringUtils isNotBlank:self.blankString]);
}

- (void)testIsBlank_empty
{
    XCTAssertTrue([CKStringUtils isBlank:self.emptyString]);
    XCTAssertFalse([CKStringUtils isNotBlank:self.emptyString]);
}

- (void)testIsBlank_multipleWhitespaceCharacters
{
    NSString *string = [NSString stringWithFormat:@"%@%@", self.emptyString, self.emptyString];
    XCTAssertTrue([CKStringUtils isBlank:string]);
    XCTAssertFalse([CKStringUtils isNotBlank:string]);
}

- (void)testIsBlank_nonWhitespaceCharacters
{
    XCTAssertFalse([CKStringUtils isBlank:@"test"]);
    XCTAssertTrue([CKStringUtils isNotBlank:@"test"]);
}

- (void)testIsBlank_nonWhitespaceWithWhitespaceCharacters
{
    XCTAssertFalse([CKStringUtils isBlank:@"  test  "]);
    XCTAssertTrue([CKStringUtils isNotBlank:@"  test  "]);
}

#pragma mark - isAllLowerCase:

- (void)testIsAllLowerCase_nil
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:self.nsNull]);
    XCTAssertFalse([CKStringUtils isAllLowerCase:self.nilString]);
}

- (void)testIsAllLowerCase_blank
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:self.blankString]);
}

- (void)testIsAllLowerCase_empty
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:self.emptyString]);
}

- (void)testIsAllLowerCase_mixedCase
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:@"abcDEF"]);
}

- (void)testIsAllLowerCase_lowerCase
{
    XCTAssertTrue([CKStringUtils isAllLowerCase:@"abc"]);
}

- (void)testIsAllLowerCase_lowerCaseWithWhitespace
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:@" abc "]);
}

- (void)testIsAllLowerCase_lowerCaseWithNumbericCharacters
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:@"abc123"]);
}

- (void)testIsAllLowerCase_lowerCaseWithSpecialCharacters
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:@"abc%$#"]);
}

- (void)testIsAllLowerCase_nonString
{
    id nonString = @(1);
    XCTAssertFalse([CKStringUtils isAllLowerCase:nonString]);
}

#pragma mark - isAllUpperCase:

- (void)testIsAllUpperCase_nil
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:self.nsNull]);
    XCTAssertFalse([CKStringUtils isAllUpperCase:self.nilString]);
}

- (void)testIsAllUpperCase_blank
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:self.blankString]);
}

- (void)testIsAllUpperCase_empty
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:self.emptyString]);
}

- (void)testIsAllUpperCase_mixedCase
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:@"abcDEF"]);
}

- (void)testIsAllUpperCase_lowerCase
{
    XCTAssertTrue([CKStringUtils isAllUpperCase:@"ABC"]);
}

- (void)testIsAllUpperCase_lowerCaseWithWhitespace
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:@" ABC "]);
}

- (void)testIsAllUpperCase_lowerCaseWithNumbericCharacters
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:@"ABC123"]);
}

- (void)testIsAllUpperCase_lowerCaseWithSpecialCharacters
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:@"ABC%$#"]);
}

- (void)testIsAllUpperCase_nonString
{
    id nonString = @(1);
    XCTAssertFalse([CKStringUtils isAllUpperCase:nonString]);
}

#pragma mark - isAlpha:

- (void)testIsAlpha_nil
{
    XCTAssertFalse([CKStringUtils isAlpha:self.nsNull]);
    XCTAssertFalse([CKStringUtils isAlpha:self.nilString]);
}

- (void)testIsAlpha_blank
{
    XCTAssertFalse([CKStringUtils isAlpha:self.blankString]);
}

- (void)testIsAlpha_empty
{
    XCTAssertFalse([CKStringUtils isAlpha:@" "]);
}

- (void)testIsAlpha_lowerCase
{
    XCTAssertTrue([CKStringUtils isAlpha:@"abc"]);
}

- (void)testIsAlpha_upperCase
{
    XCTAssertTrue([CKStringUtils isAlpha:@"ABC"]);
}

- (void)testIsAlpha_lowerCaseWithNumericValues
{
    XCTAssertFalse([CKStringUtils isAlpha:@"abc123"]);
}

- (void)testIsAlpha_upperCaseWithNumericValues
{
    XCTAssertFalse([CKStringUtils isAlpha:@"ABC123"]);
}

- (void)testIsAlpha_mixedCaseWithNumericValues
{
    XCTAssertFalse([CKStringUtils isAlpha:@"aBc123"]);
}

- (void)testIsAlpha_mixedCaseWithSpecialValues
{
    XCTAssertFalse([CKStringUtils isAlpha:@"aBc$%^"]);
}

- (void)testIsAlpha_nonString
{
    id nonString = @(1);
    XCTAssertFalse([CKStringUtils isAlpha:nonString]);
}

#pragma mark - isNumeric:

- (void)testIsNumeric_nil
{
    XCTAssertFalse([CKStringUtils isNumeric:self.nsNull]);
    XCTAssertFalse([CKStringUtils isNumeric:self.nilString]);
}

- (void)testIsNumeric_blank
{
    XCTAssertFalse([CKStringUtils isNumeric:self.blankString]);
}

- (void)testIsNumeric_empty
{
    XCTAssertFalse([CKStringUtils isNumeric:@" "]);
}

- (void)testIsNumeric_numeric
{
    XCTAssertTrue([CKStringUtils isNumeric:@"123"]);
}

- (void)testIsNumeric_numericWithWhitespace
{
    XCTAssertFalse([CKStringUtils isNumeric:@" 123 "]);
}

- (void)testIsNumeric_numericMixedWithAlphas
{
    XCTAssertFalse([CKStringUtils isNumeric:@"123aBc"]);
}

- (void)testIsNumeric_nonString
{
    id nonString = @(1);
    XCTAssertFalse([CKStringUtils isNumeric:nonString]);
}

#pragma mark - isAlphaNumeric:

- (void)testIsAlphaNumeric_nil
{
    XCTAssertFalse([CKStringUtils isAlphaNumeric:self.nsNull]);
    XCTAssertFalse([CKStringUtils isAlphaNumeric:self.nilString]);
}

- (void)testIsAlphaNumeric_blank
{
    XCTAssertFalse([CKStringUtils isAlphaNumeric:self.blankString]);
}

- (void)testIsAlphaNumeric_empty
{
    XCTAssertFalse([CKStringUtils isAlphaNumeric:@" "]);
}

- (void)testIsAlphaNumeric_numeric
{
    XCTAssertTrue([CKStringUtils isAlphaNumeric:@"123"]);
}

- (void)testIsAlphaNumeric_alpha
{
    XCTAssertTrue([CKStringUtils isAlphaNumeric:@"abc"]);
}

- (void)testIsAlphaNumeric_alphaNumeric
{
    XCTAssertTrue([CKStringUtils isAlphaNumeric:@"abc123"]);
}

- (void)testIsAlphaNumeric_numericWithWhitespace
{
    XCTAssertFalse([CKStringUtils isAlphaNumeric:@" 123 "]);
}

- (void)testIsAlphaNumeric_alphaWithWhitespace
{
    XCTAssertFalse([CKStringUtils isAlphaNumeric:@" abc "]);
}

- (void)testIsAlphaNumeric_numericMixedWithAlphas
{
    XCTAssertTrue([CKStringUtils isAlphaNumeric:@"123aBc"]);
}

- (void)testIsAlphaNumeric_nonString
{
    id nonString = @(1);
    XCTAssertFalse([CKStringUtils isAlphaNumeric:nonString]);
}

#pragma mark - string: containsString:

- (void)testContainsString_nilString
{
    XCTAssertFalse([CKStringUtils string:self.nilString containsString:@"some value" ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:self.nilString containsString:@"some value" ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:self.nilString doesNotContainString:@"some value" ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:self.nilString doesNotContainString:@"some value" ignoreCase:YES]);
    
    XCTAssertFalse([CKStringUtils string:self.nsNull containsString:@"some value" ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:self.nsNull containsString:@"some value" ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:self.nsNull doesNotContainString:@"some value" ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:self.nsNull doesNotContainString:@"some value" ignoreCase:YES]);
}

- (void)testContainsString_nilSearchString
{
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.nilString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.nilString ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.nilString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.nilString ignoreCase:YES]);

    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.nsNull ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.nsNull ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.nsNull ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.nsNull ignoreCase:YES]);
    
}

- (void)testContainsString_bothNil
{
    XCTAssertTrue([CKStringUtils string:self.nilString containsString:self.nilString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:self.nilString containsString:self.nilString ignoreCase:YES]);
    XCTAssertFalse([CKStringUtils string:self.nilString doesNotContainString:self.nilString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:self.nilString doesNotContainString:self.nilString ignoreCase:YES]);
    
    XCTAssertTrue([CKStringUtils string:self.nsNull containsString:self.nsNull ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:self.nsNull containsString:self.nsNull ignoreCase:YES]);
    XCTAssertFalse([CKStringUtils string:self.nsNull doesNotContainString:self.nsNull ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:self.nsNull doesNotContainString:self.nsNull ignoreCase:YES]);
}

- (void)testContainsString_blankString
{
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.blankString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.blankString ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.blankString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.blankString ignoreCase:YES]);
}

- (void)testContainsString_emptySring
{
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.emptyString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.emptyString ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.emptyString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.emptyString ignoreCase:YES]);
}

- (void)testContainsString_capitalized
{
    NSString *string = @"test";
    NSString *searchString = @"Test";
    
    XCTAssertFalse([CKStringUtils string:string containsString:searchString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:string containsString:searchString ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:string doesNotContainString:searchString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:string doesNotContainString:searchString ignoreCase:YES]);
}

- (void)testContainsString_withInvalidSearchString
{
    NSString *string = @"test";
    NSString *searchString = @"search";
    
    XCTAssertFalse([CKStringUtils string:string containsString:searchString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:string containsString:searchString ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:string doesNotContainString:searchString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:string doesNotContainString:searchString ignoreCase:YES]);
}

- (void)testContainsString
{
    NSString *string = @"test";
    NSString *searchString = @"test";
    
    XCTAssertTrue([CKStringUtils string:string containsString:searchString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:string containsString:searchString ignoreCase:YES]);
    XCTAssertFalse([CKStringUtils string:string doesNotContainString:searchString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:string doesNotContainString:searchString ignoreCase:YES]);
}

- (void)testContainsString_nonString
{
    id nonString = @(1);
    XCTAssertFalse([CKStringUtils string:nonString containsString:@"some value" ignoreCase:YES]);
    XCTAssertFalse([CKStringUtils string:@"some value" containsString:nonString ignoreCase:YES]);
    XCTAssertFalse([CKStringUtils string:nonString containsString:nonString ignoreCase:YES]);
    
    XCTAssertTrue([CKStringUtils string:nonString doesNotContainString:@"some value" ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:@"some value" doesNotContainString:nonString ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:nonString doesNotContainString:nonString ignoreCase:YES]);
}

#pragma mark - string: equalsString:

- (void)testStringEqualsString_bothNil
{
    XCTAssertTrue([CKStringUtils string:self.nilString equalsString:self.nilString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:self.nilString equalsString:self.nilString ignoreCase:YES]);
    
    XCTAssertTrue([CKStringUtils string:self.nsNull equalsString:self.nsNull ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:self.nsNull equalsString:self.nsNull ignoreCase:YES]);
}

- (void)testStringEqualsString_firstArgNil
{
    XCTAssertFalse([CKStringUtils string:self.nilString equalsString:@"test" ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:self.nilString equalsString:@"test" ignoreCase:YES]);
    
    XCTAssertFalse([CKStringUtils string:self.nsNull equalsString:@"test" ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:self.nsNull equalsString:@"test" ignoreCase:YES]);
}

- (void)testStringEqualsString_secondArgNil
{
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:self.nilString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:self.nilString ignoreCase:YES]);
    
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:self.nsNull ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:self.nsNull ignoreCase:YES]);
}

- (void)testStringEqualsString_equalValueStrings
{
    XCTAssertTrue([CKStringUtils string:@"test" equalsString:@"test" ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:@"test" equalsString:@"test" ignoreCase:YES]);
}

- (void)testStringEqualsString_equalObjectStrings
{
    NSString *testString = @"test";
    XCTAssertTrue([CKStringUtils string:testString equalsString:testString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:testString equalsString:testString ignoreCase:YES]);
}

- (void)testStringEqualsString_differentCase
{
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:@"TEST" ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:@"test" equalsString:@"TEST" ignoreCase:YES]);
}

- (void)testStringEqualsString_nonString
{
    id nonString = @(1);
    XCTAssertFalse([CKStringUtils string:nonString equalsString:@"TEST" ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:nonString ignoreCase:YES]);
}

#pragma mark - abbreviate: maxWidth:

- (void)testAbbreviate_nil
{
    NSString *actualNil = [CKStringUtils abbreviate:self.nilString maxWidth:3];
    XCTAssertNil(actualNil);
    
    NSString *actualNull = [CKStringUtils abbreviate:self.nsNull maxWidth:3];
    XCTAssertNil(actualNull);
}

- (void)testAbbreviate_blank
{
    NSString *actual = [CKStringUtils abbreviate:@"" maxWidth:3];
    XCTAssertEqualObjects(actual, @"");
}

- (void)testAbbreviate
{
    NSString *actual = [CKStringUtils abbreviate:@"abcdefg" maxWidth:6];
    XCTAssertEqualObjects(actual, @"abc...");
}

- (void)testAbbreviate_returnOriginalStringIfMaxWidthPlusEllipsesIsEqualThanStringLength
{
    NSString *sourceString = @"abcdefg";
    NSString *actual = [CKStringUtils abbreviate:sourceString maxWidth:7];
    XCTAssertEqualObjects(actual, sourceString);
}

- (void)testAbbreviate_returnOriginalStringIfMaxWidthPlusEllipsesIsLongerThanStringLength
{
    NSString *sourceString = @"abcdefg";
    NSString *actual = [CKStringUtils abbreviate:sourceString maxWidth:8];
    XCTAssertEqualObjects(actual, sourceString);
}

- (void)testAbbreviateInvalidMaxWidth
{
    NSString *sourceString = @"abcdefg";
    NSString *actual = [CKStringUtils abbreviate:sourceString maxWidth:3];
    XCTAssertEqualObjects(actual, sourceString);
}

- (void)testAbbreviate_nonString
{
    id nonString = @(1);
    NSString *actual = [CKStringUtils abbreviate:nonString maxWidth:3];
    XCTAssertEqualObjects(actual, @"");
}

#pragma mark - defaultString: forString:

- (void)testDefaultString_nilDefaultString
{
    NSString *defaultString = @"default";
    
    NSString *actualStringNil = [CKStringUtils defaultString:defaultString forString:self.nilString];
    NSString *actualStringNull = [CKStringUtils defaultString:defaultString forString:self.nsNull];
    
    XCTAssertEqualObjects(actualStringNil, defaultString);
    XCTAssertEqualObjects(actualStringNull, defaultString);
}

- (void)testDefaultString_nilString
{
    NSString *string = @"string";
    
    NSString *actualStringNil = [CKStringUtils defaultString:self.nilString forString:string];
    NSString *actualStringNull = [CKStringUtils defaultString:self.nilString forString:string];
    
    XCTAssertEqualObjects(actualStringNil, string);
    XCTAssertEqualObjects(actualStringNull, string);
}

- (void)testDefaultString_bothArugmentsNil
{
    NSString *actualStringNil = [CKStringUtils defaultString:self.nilString forString:self.nilString];
    NSString *actualStringNull = [CKStringUtils defaultString:self.nsNull forString:self.nsNull];
    
    XCTAssertEqualObjects(actualStringNil, @"");
    XCTAssertEqualObjects(actualStringNull, @"");
}

- (void)testDefaultString_blank
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultString:defaultString forString:self.blankString];
    
    XCTAssertEqualObjects(actualString, self.blankString);
}

- (void)testDefaultString_empty
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultString:defaultString forString:self.emptyString];
    
    XCTAssertEqualObjects(actualString, self.emptyString);
}

- (void)testDefaultString
{
    NSString *defaultString = @"defaultString";
    NSString *string = @"string";
    
    NSString *actualString = [CKStringUtils defaultString:defaultString forString:string];
    
    XCTAssertEqualObjects(actualString, string);
}

- (void)testDefaultString_nonString
{
    id nonString = @(1);
    NSString *string = @"string";
    
    XCTAssertEqualObjects([CKStringUtils defaultString:nonString forString:string], string);
    XCTAssertEqualObjects([CKStringUtils defaultString:string forString:nonString], @"");
    XCTAssertEqualObjects([CKStringUtils defaultString:nonString forString:nonString], @"");
}

#pragma mark - defaultStringIfEmpty: forString:

- (void)testDefaultStringIfEmpty_nilDefaultString
{
    NSString *defaultString = @"default";
    
    NSString *actualStringNil = [CKStringUtils defaultStringIfEmpty:defaultString forString:self.nilString];
    NSString *actualStringNull = [CKStringUtils defaultStringIfEmpty:defaultString forString:self.nsNull];
    
    XCTAssertEqualObjects(actualStringNil, defaultString);
    XCTAssertEqualObjects(actualStringNull, defaultString);
}

- (void)testDefaultStringIfEmpty_nilString
{
    NSString *string = @"string";
    
    NSString *actualStringNil = [CKStringUtils defaultStringIfEmpty:self.nilString forString:string];
    NSString *actualStringNull = [CKStringUtils defaultStringIfEmpty:self.nsNull forString:string];
    
    XCTAssertEqualObjects(actualStringNil, string);
    XCTAssertEqualObjects(actualStringNull, string);
}

- (void)testDefaultStringIfEmpty_bothArugmentsNil
{
    NSString *actualStringNil = [CKStringUtils defaultStringIfEmpty:self.nilString forString:self.nilString];
    NSString *actualStringNull = [CKStringUtils defaultStringIfEmpty:self.nsNull forString:self.nsNull];
    
    XCTAssertEqualObjects(actualStringNil, @"");
    XCTAssertEqualObjects(actualStringNull, @"");
}

- (void)testDefaultStringIfEmpty_blank
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultStringIfEmpty:defaultString forString:self.blankString];
    
    XCTAssertEqualObjects(actualString, self.blankString);
}

- (void)testDefaultStringIfEmpty_empty
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultStringIfEmpty:defaultString forString:self.emptyString];
    
    XCTAssertEqualObjects(actualString, defaultString);
}

- (void)testDefaultStringIfEmpty
{
    NSString *defaultString = @"defaultString";
    NSString *string = @"string";
    
    NSString *actualString = [CKStringUtils defaultStringIfEmpty:defaultString forString:string];
    
    XCTAssertEqualObjects(actualString, string);
}

- (void)testDefaultStringIfEmpty_nonString
{
    id nonString = @(1);
    NSString *string = @"string";
    
    XCTAssertEqualObjects([CKStringUtils defaultStringIfEmpty:nonString forString:string], string);
    XCTAssertEqualObjects([CKStringUtils defaultStringIfEmpty:string forString:nonString], @"");
    XCTAssertEqualObjects([CKStringUtils defaultStringIfEmpty:nonString forString:nonString], @"");
}

#pragma mark - defaultStringIfBlank: forString:

- (void)testDefaultStringIfBlank_nilDefaultString
{
    NSString *defaultString = @"default";
    
    NSString *actualStringNil = [CKStringUtils defaultStringIfBlank:defaultString forString:self.nilString];
    NSString *actualStringNull = [CKStringUtils defaultStringIfBlank:defaultString forString:self.nsNull];
    
    XCTAssertEqualObjects(actualStringNil, defaultString);
    XCTAssertEqualObjects(actualStringNull, defaultString);
}

- (void)testDefaultStringIfBlank_nilString
{
    NSString *string = @"string";
    
    NSString *actualStringNil = [CKStringUtils defaultStringIfBlank:self.nilString forString:string];
    NSString *actualStringNull = [CKStringUtils defaultStringIfBlank:self.nsNull forString:string];
    
    XCTAssertEqualObjects(actualStringNil, string);
    XCTAssertEqualObjects(actualStringNull, string);
}

- (void)testDefaultStringIfBlank_bothArugmentsNil
{
    NSString *actualStringNil = [CKStringUtils defaultStringIfBlank:self.nilString forString:self.nilString];
    NSString *actualStringNull = [CKStringUtils defaultStringIfBlank:self.nsNull forString:self.nsNull];
    
    XCTAssertEqualObjects(actualStringNil, @"");
    XCTAssertEqualObjects(actualStringNull, @"");
}

- (void)testDefaultStringIfBlank_blank
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultStringIfBlank:defaultString forString:self.blankString];
    
    XCTAssertEqualObjects(actualString, defaultString);
}

- (void)testDefaultStringIfBlank_empty
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultStringIfBlank:defaultString forString:self.emptyString];
    
    XCTAssertEqualObjects(actualString, defaultString);
}

- (void)testDefaultStringIfBlank
{
    NSString *defaultString = @"defaultString";
    NSString *string = @"string";
    
    NSString *actualString = [CKStringUtils defaultStringIfBlank:defaultString forString:string];
    
    XCTAssertEqualObjects(actualString, string);
}

- (void)testDefaultStringIfBlank_nonString
{
    id nonString = @(1);
    NSString *string = @"string";
    
    XCTAssertEqualObjects([CKStringUtils defaultStringIfBlank:nonString forString:string], string);
    XCTAssertEqualObjects([CKStringUtils defaultStringIfBlank:string forString:nonString], @"");
    XCTAssertEqualObjects([CKStringUtils defaultStringIfBlank:nonString forString:nonString], @"");
}

#pragma mark - isValidEmailAddress:

- (void)testIsEmailAddressValid_validEmailAddress
{
    NSArray *validEmailAddresses = @[@"email@example.com",
                                     @"firstname.lastname@example.com",
                                     @"email@subdomain.example.com",
                                     @"firstname+lastname@example.com",
                                     @"email@123.123.123.123",
                                     @"email@[123.123.123.123]",
                                     @"\"email\"@example.com",
                                     @"1234567890@example.com",
                                     @"email@example-one.com",
                                     @"_______@example.com",
                                     @"email@example.name",
                                     @"email@example.museum",
                                     @"email@example.co.jp",
                                     @"UpperCase@example.com",
                                     @"firstname-lastname@example.com"];
    
    __block BOOL isValid = NO;
    [validEmailAddresses enumerateObjectsUsingBlock:^(NSString *emailAddress, NSUInteger index, BOOL *stop) {
        isValid = [CKStringUtils isValidEmailAddress:emailAddress];
        if(!isValid){
            *stop = YES;
        }
    }];
    
    XCTAssertTrue(isValid);
}

- (void)testIsEmailAddressValid_invalidEmailAddress
{
    NSArray *invalidEmailAddresses = @[
                                       @"plainaddress",
                                       @"#@%^%#$@#$@#.com",
                                       @"@example.com",
                                       @"Joe Smith <email@example.com>",
                                       @"email.example.com",
                                       @"email@example@example.com",
                                       @".email@example.com",
                                       @"email.@example.com",
                                       @"email..email@example.com",
                                       @"あいうえお@example.com",
                                       @"email@example.com (Joe Smith)",
                                       @"email@example",
                                       @"email@-example.com"];

    
    __block BOOL isValid = YES;
    [invalidEmailAddresses enumerateObjectsUsingBlock:^(NSString *emailAddress, NSUInteger index, BOOL *stop) {
        isValid = [CKStringUtils isValidEmailAddress:emailAddress];
        NSLog(@"valid ? %@ || %@", (isValid) ? @"Y" : @"N", emailAddress);
        if(isValid){
            *stop = YES;
        }
    }];
    
    XCTAssertFalse(isValid);
}

- (void)testIsEmailAddressValid_nilEmptyBlank
{
    XCTAssertFalse([CKStringUtils isValidEmailAddress:self.nilString]);
    XCTAssertFalse([CKStringUtils isValidEmailAddress:self.nsNull]);
    XCTAssertFalse([CKStringUtils isValidEmailAddress:self.emptyString]);
    XCTAssertFalse([CKStringUtils isValidEmailAddress:self.blankString]);
}

- (void)testIsEmailAddressValid_nonString
{
    id nonString = @(1);
    XCTAssertFalse([CKStringUtils isValidEmailAddress:nonString]);
}

#pragma mark stringByTrimmingLeadingWhitespaceCharactersInString:

- (void)testStringByTrimmingLeadingWhitespaceCharactersInString_nilEmptyBlank
{
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:self.nilString], @"");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:self.nsNull], @"");
    XCTAssertEqual([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:self.emptyString], self.emptyString);
    XCTAssertEqual([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:self.blankString], self.blankString);
}

- (void)testStringByTrimmingLeadingWhitespaceCharactersInString_leadingSpaceStrings
{
    NSString *testStringOne =   @" string";
    NSString *testStringTwo =   @"  string";
    NSString *testStringThree = @"  string";
    NSString *testStringFour =  @"  string";
    
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:testStringOne], @"string");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:testStringTwo], @"string");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:testStringThree], @"string");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:testStringFour], @"string");
}

- (void)testStringByTrimmingLeadingWhitespaceCharactersInString_otherSpaceStrings
{
    NSString *testStringOne =   @"string ";
    NSString *testStringTwo =   @"string  ";
    NSString *testStringThree = @"str ing";
    NSString *testStringFour =  @"string    ";
    
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:testStringOne], testStringOne);
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:testStringTwo], testStringTwo);
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:testStringThree], testStringThree);
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:testStringFour], testStringFour);
}

- (void)testStringByTrimmingLeadingWhitespaceCharactersInString_nonString
{
    id nonString = @(1);

    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:nonString], @"");
}

#pragma mark stringByTrimmingTrailingWhitespaceCharactersInString:

- (void)testStringByTrimmingTrailingWhitespaceCharactersInString_nilEmptyBlank
{
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:self.nilString], @"");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:self.nsNull], @"");
    XCTAssertEqual([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:self.emptyString], self.emptyString);
    XCTAssertEqual([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:self.blankString], self.blankString);
}

- (void)testStringByTrimmingTrailingWhitespaceCharactersInString_leadingSpaceStrings
{
    NSString *testStringOne =   @"string ";
    NSString *testStringTwo =   @"string  ";
    NSString *testStringThree = @"string   ";
    NSString *testStringFour =  @"string    ";
    
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:testStringOne], @"string");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:testStringTwo], @"string");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:testStringThree], @"string");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:testStringFour], @"string");
}

- (void)testStringByTrimmingTrailingWhitespaceCharactersInString_otherSpaceStrings
{
    NSString *testStringOne =   @" string";
    NSString *testStringTwo =   @"  string";
    NSString *testStringThree = @"str ing";
    NSString *testStringFour =  @"  string";
    
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:testStringOne], testStringOne);
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:testStringTwo], testStringTwo);
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:testStringThree], testStringThree);
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:testStringFour], testStringFour);
}

- (void)testStringByTrimmingTrailingWhitespaceCharactersInString_nonString
{
    id nonString = @(1);
    
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:nonString], @"");
}

#pragma mark stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:

- (void)testStringByTrimmingLeadingAndTrailingWhitespaceCharactersInString_nilEmptyBlank
{
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:self.nilString], @"");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:self.nsNull], @"");
    XCTAssertEqual([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:self.emptyString], self.emptyString);
    XCTAssertEqual([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:self.blankString], self.blankString);
}

- (void)testStringByTrimmingLeadingAndTrailingWhitespaceCharactersInString_leadingSpaceStrings
{
    NSString *testStringOne =   @"string ";
    NSString *testStringTwo =   @" string";
    NSString *testStringThree = @" string ";
    NSString *testStringFour =  @"  string    ";
    
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:testStringOne], @"string");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:testStringTwo], @"string");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:testStringThree], @"string");
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:testStringFour], @"string");
}

- (void)testStringByTrimmingLeadingAndTrailingWhitespaceCharactersInString_otherSpaceStrings
{
    NSString *testString = @"str ing";
    
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:testString], testString);
}

- (void)testStringByTrimmingLeadingAndTrailingWhitespaceCharactersInString_nonString
{
    id nonString = @(1);
    
    XCTAssertEqualObjects([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:nonString], @"");
}

#pragma mark - stringByUrlEscapingString

- (void)testStringByUrlEscapingString_illegalCharactersSet
{
    NSString *actual = [CKStringUtils illegalCharaterSet];
    NSString *expected = self.illegalCharacterSet;
    XCTAssertEqualObjects(actual, expected);
}

- (void)testStringByUrlEscapingString_encodesIllegalCharsCorrectly
{
    for(int i = 0; i < self.illegalCharacterSet.length; i++){
        unichar c = [self.illegalCharacterSet characterAtIndex:i];
        
        NSString *illegalCharacter = [NSString stringWithFormat: @"%C", c];
        NSString *actualCharacter = [CKStringUtils stringByUrlEscapingString:illegalCharacter];
        
        NSString *expectedCharacter = [self.retrieveIllegalCharacterDictionary objectForKey:illegalCharacter];
        
        XCTAssertEqualObjects(actualCharacter, expectedCharacter);
    }
}

- (void)testStringByUrlEscapingString_testDoesStringContainIllegalHttpCharactersWithIllegalCharacters
{
    for(int i = 0; i < self.illegalCharacterSet.length; i++){
        unichar c = [self.illegalCharacterSet characterAtIndex:i];
        NSString *illegalCharacter = [NSString stringWithFormat: @"%C", c];
        
        XCTAssertTrue([CKStringUtils doesStringContainIllegalUrlCharacters:illegalCharacter]);
    }
}

- (void)testStringByUrlEscapingString_testDoesStringContainIllegalHttpCharactersWithLegalCharacters
{
    NSString *validCharacters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789-.\\_";
    
    for(int i = 0; i < validCharacters.length; i++){
        unichar c = [validCharacters characterAtIndex:i];
        NSString *legalCharacter = [NSString stringWithFormat: @"%C", c];
        
        XCTAssertFalse([CKStringUtils doesStringContainIllegalUrlCharacters:legalCharacter]);
    }
}

- (void)testStringByUrlEscapingString_testUrlSafeStringRetrunsEncodedString
{
    for (NSString *illegalString in self.retrieveIllegalCharacterDictionary.allKeys){
        NSString *encodedString = self.retrieveIllegalCharacterDictionary[illegalString];
        XCTAssertEqualObjects([CKStringUtils stringByUrlEscapingString:illegalString], encodedString);
    }
}

- (void)testStringByUrlEscapingString_returnOriginalIfNilEmtpyOrBlank
{
    XCTAssertEqualObjects([CKStringUtils stringByUrlEscapingString:self.nilString], @"");
    XCTAssertEqualObjects([CKStringUtils stringByUrlEscapingString:self.nsNull], @"");
    XCTAssertEqual([CKStringUtils stringByUrlEscapingString:self.emptyString], self.emptyString);
    XCTAssertEqual([CKStringUtils stringByUrlEscapingString:self.blankString], self.blankString);
}

- (void)testStringByUrlEscapingString_nonString
{
    id nonString = @(1);
    
    XCTAssertEqualObjects([CKStringUtils stringByUrlEscapingString:nonString], @"");
}

#pragma mark - Test Helpers

- (NSString *)illegalCharacterSet
{
    return @"!*'();:@&=+@,/?#[]";
}

- (NSDictionary *)retrieveIllegalCharacterDictionary
{
    return @{   @"!":@"%21",
                @"*":@"%2A",
                @"'":@"%27",
                @"(":@"%28",
                @")":@"%29",
                @";":@"%3B",
                @":":@"%3A",
                @"@":@"%40",
                @"&":@"%26",
                @"=":@"%3D",
                @"+":@"%2B",
                @"@":@"%40",
                @",":@"%2C",
                @"/":@"%2F",
                @"?":@"%3F",
                @"#":@"%23",
                @"[":@"%5B",
                @"]":@"%5D"};
}

@end