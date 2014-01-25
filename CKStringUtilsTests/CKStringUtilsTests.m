//
//  CKStringUtilsTests.m
//  CKStringUtilsTests
//
//  Created by Cody Kimberling on 12/14/13.
//  Copyright (c) 2013 Cody Kimberling. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CKStringUtils.h"
#import "OCMock.h"

@interface CKStringUtils (TestHelper)

+ (NSString *)illegalCharaterSet;
+ (BOOL)doesStringContainIllegalUrlCharacters:(NSString *)string;

@end

@interface CKStringUtilsTests : XCTestCase

@property (nonatomic) NSString *nilString;
@property (nonatomic) NSString *blankString;
@property (nonatomic) NSString *emptyString;

@end

@implementation CKStringUtilsTests

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    
    self.nilString = nil;
    self.emptyString = @"";
    self.blankString = @" ";
}

#pragma mark - isNil: isNotNil:

- (void)testIsNil_nil
{
    XCTAssertTrue([CKStringUtils isNil:nil]);
    XCTAssertFalse([CKStringUtils isNotNil:nil]);
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
    XCTAssertTrue([CKStringUtils isEmpty:nil]);
    XCTAssertFalse([CKStringUtils isNotEmpty:nil]);
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
    XCTAssertTrue([CKStringUtils isBlank:nil]);
    XCTAssertFalse([CKStringUtils isNotBlank:nil]);
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
    XCTAssertFalse([CKStringUtils isAllLowerCase:nil]);
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

#pragma mark - isAllUpperCase:

- (void)testIsAllUpperCase_nil
{
    XCTAssertFalse([CKStringUtils isAllUpperCase:nil]);
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

#pragma mark - isAlpha:

- (void)testIsAlpha_nil
{
    XCTAssertFalse([CKStringUtils isAlpha:nil]);
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

#pragma mark - isNumeric:

- (void)testIsNumeric_nil
{
    XCTAssertFalse([CKStringUtils isNumeric:nil]);
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

#pragma mark - isAlphaNumeric:

- (void)testIsAlphaNumeric_nil
{
    XCTAssertFalse([CKStringUtils isAlphaNumeric:nil]);
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
    XCTAssertFalse([CKStringUtils isValidEmailAddress:nil]);
    XCTAssertFalse([CKStringUtils isValidEmailAddress:self.emptyString]);
    XCTAssertFalse([CKStringUtils isValidEmailAddress:self.blankString]);
}

#pragma mark stringByTrimmingLeadingWhitespaceCharactersInString:

- (void)testStringByTrimmingLeadingWhitespaceCharactersInString_nilEmptyBlank
{
    XCTAssertEqual([CKStringUtils stringByTrimmingLeadingWhitespaceCharactersInString:self.nilString], self.nilString);
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

#pragma mark stringByTrimmingTrailingWhitespaceCharactersInString:

- (void)testStringByTrimmingTrailingWhitespaceCharactersInString_nilEmptyBlank
{
    XCTAssertEqual([CKStringUtils stringByTrimmingTrailingWhitespaceCharactersInString:self.nilString], self.nilString);
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

#pragma mark stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:

- (void)testStringByTrimmingLeadingAndTrailingWhitespaceCharactersInString_nilEmptyBlank
{
    XCTAssertEqual([CKStringUtils stringByTrimmingLeadingAndTrailingWhitespaceCharactersInString:self.nilString], self.nilString);
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
    XCTAssertEqual([CKStringUtils stringByUrlEscapingString:self.nilString], self.nilString);
    XCTAssertEqual([CKStringUtils stringByUrlEscapingString:self.emptyString], self.emptyString);
    XCTAssertEqual([CKStringUtils stringByUrlEscapingString:self.blankString], self.blankString);
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