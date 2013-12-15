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

@property (nonatomic) NSString *nilString;
@property (nonatomic) NSString *emptyString;
@property (nonatomic) NSString *whitespaceString;

@end

@implementation CKStringUtilsTests


#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.nilString = nil;
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
    XCTAssertTrue([CKStringUtils isNil:self.nilString], @"Return YES if nil");
    XCTAssertFalse([CKStringUtils isNotNil:self.nilString], @"Return NO if nil");
}

- (void)testIsNil_empty
{
    XCTAssertFalse([CKStringUtils isNil:self.emptyString], @"Return NO if not nil");
    XCTAssertTrue([CKStringUtils isNotNil:self.emptyString], @"Return YES if not nil");
}

- (void)testIsNil
{
    XCTAssertFalse([CKStringUtils isNil:@"string"], @"Return NO if not nil");
    XCTAssertTrue([CKStringUtils isNotNil:@"string"], @"Return YES if not nil");
}

#pragma mark - isEmpty: isNotEmpty

- (void)testIsEmpty_nil
{
    XCTAssertTrue([CKStringUtils isEmpty:self.nilString], @"Return YES if nil");
    XCTAssertFalse([CKStringUtils isNotEmpty:self.nilString], @"Return NO if nil");
}

- (void)testIsEmpty_emptyString
{
    XCTAssertTrue([CKStringUtils isEmpty:self.emptyString], @"Return YES if nil");
    XCTAssertFalse([CKStringUtils isNotEmpty:self.emptyString], @"Return NO if nil");
}

- (void)testIsEmpty_blankString
{
    XCTAssertFalse([CKStringUtils isEmpty:self.whitespaceString], @"Return NO if blank");
    XCTAssertTrue([CKStringUtils isNotEmpty:self.whitespaceString], @"Return YES if blank");
}

- (void)testIsEmpty_whitespaceString
{
    XCTAssertFalse([CKStringUtils isEmpty:@"  test  "], @"Return NO if string is populated");
    XCTAssertTrue([CKStringUtils isNotEmpty:@"  test  "], @"Return YES if string is populated");
}

- (void)testIsEmpty
{
    XCTAssertFalse([CKStringUtils isEmpty:@"test"], @"Return NO if string is populated");
    XCTAssertTrue([CKStringUtils isNotEmpty:@"test"], @"Return YES if string is populated");
}

#pragma mark - isBlank: isNotBlank

- (void)testIsBlank_nil
{
    XCTAssertTrue([CKStringUtils isBlank:self.nilString], @"Return YES if nil");
    XCTAssertFalse([CKStringUtils isNotBlank:self.nilString], @"Return NO if nil");
}

- (void)testIsBlank_empty
{
    XCTAssertTrue([CKStringUtils isBlank:self.emptyString], @"Return YES if empty");
    XCTAssertFalse([CKStringUtils isNotBlank:self.emptyString], @"Return NO if empty");
}

- (void)testIsBlank_whitespace
{
    XCTAssertTrue([CKStringUtils isBlank:self.whitespaceString], @"Return YES if whitespace");
    XCTAssertFalse([CKStringUtils isNotBlank:self.whitespaceString], @"Return NO if whitespace");
}

- (void)testIsBlank_multipleWhitespaceCharacters
{
    NSString *string = [NSString stringWithFormat:@"%@%@", self.whitespaceString, self.whitespaceString];
    XCTAssertTrue([CKStringUtils isBlank:string], @"Return YES if multiple whiltespaces");
    XCTAssertFalse([CKStringUtils isNotBlank:string], @"Return NO if multiple whiltespaces");
}

- (void)testIsBlank_nonWhitespaceCharacters
{
    XCTAssertFalse([CKStringUtils isBlank:@"test"], @"Return NO if multiple whiltespaces");
    XCTAssertTrue([CKStringUtils isNotBlank:@"test"], @"Return YES if multiple whiltespaces");
}

- (void)testIsBlank_nonWhitespaceWithWhitespaceCharacters
{
    XCTAssertFalse([CKStringUtils isBlank:@"  test  "], @"Return NO if multiple whiltespaces");
    XCTAssertTrue([CKStringUtils isNotBlank:@"  test  "], @"Return YES if multiple whiltespaces");
}

#pragma mark - string: equalsString:

- (void)testStringEqualsString_bothNil
{
    XCTAssertTrue([CKStringUtils string:nil equalsString:nil]);
}

- (void)testStringEqualsString_firstArgNil
{
    XCTAssertFalse([CKStringUtils string:nil equalsString:@"test"]);
}

- (void)testStringEqualsString_secondArgNil
{
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:nil]);
}

- (void)testStringEqualsString_equalValueStrings
{
    XCTAssertTrue([CKStringUtils string:@"test" equalsString:@"test"]);
}

- (void)testStringEqualsString_equalObjectStrings
{
    NSString *testString = @"test";
    XCTAssertTrue([CKStringUtils string:testString equalsString:testString]);
}

- (void)testStringEqualsString_differentCase
{
    XCTAssertFalse([CKStringUtils string:@"test" equalsString:@"TEST"]);
}

#pragma mark - abbreviate: maxWidth:

- (void)testAbbreviate_nil
{
    NSString *actual = [CKStringUtils abbreviate:nil maxWidth:3];
    XCTAssertNil(actual, @"Return nil if String is nil");
}

- (void)testAbbreviate_empty
{
    NSString *actual = [CKStringUtils abbreviate:@"" maxWidth:3];
    XCTAssertEqualObjects(actual, @"", @"Return empty if String is empty");
}

- (void)testAbbreviate
{
    NSString *actual = [CKStringUtils abbreviate:@"abcdefg" maxWidth:6];
    XCTAssertEqualObjects(actual, @"abc...",@"Return abbrteviated string");
}

- (void)testAbbreviate_returnOriginalStringIfMaxWidthPlusEllipsesIsEqualThanStringLength
{
    NSString *sourceString = @"abcdefg";
    NSString *actual = [CKStringUtils abbreviate:sourceString maxWidth:7];
    XCTAssertEqualObjects(actual, sourceString, @"Return abbrteviated string");
}

- (void)testAbbreviate_returnOriginalStringIfMaxWidthPlusEllipsesIsLongerThanStringLength
{
    NSString *sourceString = @"abcdefg";
    NSString *actual = [CKStringUtils abbreviate:sourceString maxWidth:8];
    XCTAssertEqualObjects(actual, sourceString, @"Return abbrteviated string");
}

- (void)testAbbreviateInvalidMaxWidth
{
    NSString *sourceString = @"abcdefg";
    NSString *actual = [CKStringUtils abbreviate:sourceString maxWidth:3];
    XCTAssertEqualObjects(actual, sourceString, @"Return abbrteviated string if max width is invalid");
}

@end
