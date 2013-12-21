//
//  CKStringUtilsTests.m
//  CKStringUtilsTests
//
//  Created by Cody Kimberling on 12/14/13.
//  Copyright (c) 2013 Cody Kimberling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CKStringUtils.h"

@interface CKStringUtilsTests : XCTestCase

@property (nonatomic) NSString *emptyString;
@property (nonatomic) NSString *whitespaceString;

@end

@implementation CKStringUtilsTests


#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.emptyString = @"";
    self.whitespaceString = @" ";
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - isNil: isNotNil:

- (void)testIsNil_nil
{
    XCTAssertTrue([CKStringUtils isNil:nil]);
    XCTAssertFalse([CKStringUtils isNotNil:nil]);
}

- (void)testIsNil_empty
{
    XCTAssertFalse([CKStringUtils isNil:self.emptyString]);
    XCTAssertTrue([CKStringUtils isNotNil:self.emptyString]);
}

- (void)testIsNil
{
    XCTAssertFalse([CKStringUtils isNil:@"string"]);
    XCTAssertTrue([CKStringUtils isNotNil:@"string"]);
}

#pragma mark - isEmpty: isNotEmpty

- (void)testIsEmpty_nil
{
    XCTAssertTrue([CKStringUtils isEmpty:nil]);
    XCTAssertFalse([CKStringUtils isNotEmpty:nil]);
}

- (void)testIsEmpty_emptyString
{
    XCTAssertTrue([CKStringUtils isEmpty:self.emptyString]);
    XCTAssertFalse([CKStringUtils isNotEmpty:self.emptyString]);
}

- (void)testIsEmpty_blankString
{
    XCTAssertFalse([CKStringUtils isEmpty:self.whitespaceString]);
    XCTAssertTrue([CKStringUtils isNotEmpty:self.whitespaceString]);
}

- (void)testIsEmpty_whitespaceString
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
    XCTAssertTrue([CKStringUtils isBlank:nil]);
    XCTAssertFalse([CKStringUtils isNotBlank:nil]);
}

- (void)testIsBlank_empty
{
    XCTAssertTrue([CKStringUtils isBlank:self.emptyString]);
    XCTAssertFalse([CKStringUtils isNotBlank:self.emptyString]);
}

- (void)testIsBlank_whitespace
{
    XCTAssertTrue([CKStringUtils isBlank:self.whitespaceString]);
    XCTAssertFalse([CKStringUtils isNotBlank:self.whitespaceString]);
}

- (void)testIsBlank_multipleWhitespaceCharacters
{
    NSString *string = [NSString stringWithFormat:@"%@%@", self.whitespaceString, self.whitespaceString];
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

#pragma mark - isWhitespace:

- (void)testIsWhitespace_nil
{
    XCTAssertFalse([CKStringUtils isWhitespace:nil]);
}

- (void)testIsWhitespace_singleWhitespaceChars
{
    XCTAssertTrue([CKStringUtils isWhitespace:self.whitespaceString]);
}

- (void)testIsWhitespace_multipleWhitespaceChars
{
    XCTAssertTrue([CKStringUtils isWhitespace:@"   "]);
}

- (void)testIsWhitespace_nonEmptyString
{
    XCTAssertFalse([CKStringUtils isWhitespace:@"test"]);
}

- (void)testIsWhitespace_nonEmptyStringWithWhitespaceChars
{
    XCTAssertFalse([CKStringUtils isWhitespace:@"  test  "]);
}

- (void)testIsWhitespace_emptyString
{
    XCTAssertFalse([CKStringUtils isWhitespace:self.emptyString]);
}

#pragma mark - isAllLowerCase:

- (void)testIsAllLowerCase_nil
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:nil]);
}

- (void)testIsAllLowerCase_empty
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:self.emptyString]);
}

- (void)testIsAllLowerCase_blank
{
    XCTAssertFalse([CKStringUtils isAllLowerCase:self.whitespaceString]);
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

#pragma mark - isAllUpperCase:

- (void)testIsAllUpperCase_nil
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:nil]);
}

- (void)testIsAllUpperCase_empty
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:self.emptyString]);
}

- (void)testIsAllUpperCase_blank
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:self.whitespaceString]);
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

#pragma mark - isAlpha:

- (void)testIsAlpha_nil
{
    XCTAssertFalse([CKStringUtils isAlpha:nil]);
}

- (void)testIsAlpha_empty
{
    XCTAssertFalse([CKStringUtils isAlpha:self.emptyString]);
}

- (void)testIsAlpha_whitespace
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

#pragma mark - isNumeric:

- (void)testIsNumeric_nil
{
    XCTAssertFalse([CKStringUtils isNumeric:nil]);
}

- (void)testIsNumeric_empty
{
    XCTAssertFalse([CKStringUtils isNumeric:self.emptyString]);
}

- (void)testIsNumeric_whitespace
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

#pragma mark - isAlphaNumeric:

- (void)testIsAlphaNumeric_nil
{
    XCTAssertFalse([CKStringUtils isAlphaNumeric:nil]);
}

- (void)testIsAlphaNumeric_empty
{
    XCTAssertFalse([CKStringUtils isAlphaNumeric:self.emptyString]);
}

- (void)testIsAlphaNumeric_whitespace
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

#pragma mark - string: containsString:

- (void)testContainsString_nilString
{
    XCTAssertFalse([CKStringUtils string:nil containsString:@"some value" ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:nil containsString:@"some value" ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:nil doesNotContainString:@"some value" ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:nil doesNotContainString:@"some value" ignoreCase:YES]);
}

- (void)testContainsString_nilSearchString
{
    XCTAssertFalse([CKStringUtils string:@"test" containsString:nil ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" containsString:nil ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:nil ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:nil ignoreCase:YES]);
}

- (void)testContainsString_bothNil
{
    XCTAssertTrue([CKStringUtils string:nil containsString:nil ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:nil containsString:nil ignoreCase:YES]);
    XCTAssertFalse([CKStringUtils string:nil doesNotContainString:nil ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:nil doesNotContainString:nil ignoreCase:YES]);
}

- (void)testContainsString_emptyString
{
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.emptyString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.emptyString ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.emptyString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.emptyString ignoreCase:YES]);
}

- (void)testContainsString_blankString
{
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.whitespaceString ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" containsString:self.whitespaceString ignoreCase:YES]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.whitespaceString ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:@"test" doesNotContainString:self.whitespaceString ignoreCase:YES]);
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

#pragma mark - string: equalsString:

- (void)testStringEqualsString_bothNil
{
    XCTAssertTrue([CKStringUtils string:nil equalsString:nil ignoreCase:NO]);
    XCTAssertTrue([CKStringUtils string:nil equalsString:nil ignoreCase:YES]);
}

- (void)testStringEqualsString_firstArgNil
{
    XCTAssertFalse([CKStringUtils string:nil equalsString:@"test" ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:nil equalsString:@"test" ignoreCase:YES]);
}

- (void)testStringEqualsString_secondArgNil
{
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:nil ignoreCase:NO]);
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:nil ignoreCase:YES]);
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

#pragma mark - abbreviate: maxWidth:

- (void)testAbbreviate_nil
{
    NSString *actual = [CKStringUtils abbreviate:nil maxWidth:3];
    XCTAssertNil(actual);
}

- (void)testAbbreviate_empty
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

#pragma mark - defaultString: forString:

- (void)testDefaultString_nilDefaultString
{
    NSString *defaultString = @"default";
    
    NSString *actualString = [CKStringUtils defaultString:defaultString forString:nil];
    
    XCTAssertEqualObjects(actualString, defaultString);
}

- (void)testDefaultString_nilString
{
    NSString *string = @"string";
    
    NSString *actualString = [CKStringUtils defaultString:nil forString:string];
    
    XCTAssertEqualObjects(actualString, string);
}

- (void)testDefaultString_bothArugmentsNil
{
    NSString *actualString = [CKStringUtils defaultString:nil forString:nil];
    
    XCTAssertNil(actualString);
}

- (void)testDefaultString_empty
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultString:defaultString forString:self.emptyString];
    
    XCTAssertEqualObjects(actualString, self.emptyString);
}

- (void)testDefaultString_whitespace
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultString:defaultString forString:self.whitespaceString];
    
    XCTAssertEqualObjects(actualString, self.whitespaceString);
}

- (void)testDefaultString
{
    NSString *defaultString = @"defaultString";
    NSString *string = @"string";
    
    NSString *actualString = [CKStringUtils defaultString:defaultString forString:string];
    
    XCTAssertEqualObjects(actualString, string);
}

#pragma mark - defaultStringIfEmpty: forString:

- (void)testDefaultStringIfEmpty_nilDefaultString
{
    NSString *defaultString = @"default";
    
    NSString *actualString = [CKStringUtils defaultStringIfEmpty:defaultString forString:nil];
    
    XCTAssertEqualObjects(actualString, defaultString);
}

- (void)testDefaultStringIfEmpty_nilString
{
    NSString *string = @"string";
    
    NSString *actualString = [CKStringUtils defaultStringIfEmpty:nil forString:string];
    
    XCTAssertEqualObjects(actualString, string);
}

- (void)testDefaultStringIfEmpty_bothArugmentsNil
{
    NSString *actualString = [CKStringUtils defaultStringIfEmpty:nil forString:nil];
    
    XCTAssertNil(actualString);
}

- (void)testDefaultStringIfEmpty_empty
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultStringIfEmpty:defaultString forString:self.emptyString];
    
    XCTAssertEqualObjects(actualString, defaultString);
}

- (void)testDefaultStringIfEmpty_whitespace
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultStringIfEmpty:defaultString forString:self.whitespaceString];
    
    XCTAssertEqualObjects(actualString, self.whitespaceString);
}

- (void)testDefaultStringIfEmpty
{
    NSString *defaultString = @"defaultString";
    NSString *string = @"string";
    
    NSString *actualString = [CKStringUtils defaultStringIfEmpty:defaultString forString:string];
    
    XCTAssertEqualObjects(actualString, string);
}

#pragma mark - defaultStringIfBlank: forString:

- (void)testDefaultStringIfBlank_nilDefaultString
{
    NSString *defaultString = @"default";
    
    NSString *actualString = [CKStringUtils defaultStringIfBlank:defaultString forString:nil];
    
    XCTAssertEqualObjects(actualString, defaultString);
}

- (void)testDefaultStringIfBlank_nilString
{
    NSString *string = @"string";
    
    NSString *actualString = [CKStringUtils defaultStringIfBlank:nil forString:string];
    
    XCTAssertEqualObjects(actualString, string);
}

- (void)testDefaultStringIfBlank_bothArugmentsNil
{
    NSString *actualString = [CKStringUtils defaultStringIfBlank:nil forString:nil];
    
    XCTAssertNil(actualString);
}

- (void)testDefaultStringIfBlank_empty
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultStringIfBlank:defaultString forString:self.emptyString];
    
    XCTAssertEqualObjects(actualString, defaultString);
}

- (void)testDefaultStringIfBlank_whitespace
{
    NSString *defaultString = @"defaultString";
    
    NSString *actualString = [CKStringUtils defaultStringIfBlank:defaultString forString:self.whitespaceString];
    
    XCTAssertEqualObjects(actualString, defaultString);
}

- (void)testDefaultStringIfBlank
{
    NSString *defaultString = @"defaultString";
    NSString *string = @"string";
    
    NSString *actualString = [CKStringUtils defaultStringIfBlank:defaultString forString:string];
    
    XCTAssertEqualObjects(actualString, string);
}

@end