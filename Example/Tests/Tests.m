//
//  SpinnerButtonTests.m
//  SpinnerButtonTests
//
//  Created by maxkalik on 06/08/2021.
//  Copyright (c) 2021 maxkalik. All rights reserved.
//

@import XCTest;
@import SpinnerButton;

@interface Tests : XCTestCase

@property (nonatomic, strong) SpinnerButton *button;

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    self.button = [[SpinnerButton alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitialButtonTitleNormalState
{
    NSString *title = self.button.currentTitle;
    NSString *expectedResult = @"Spinner Button";
    XCTAssertTrue([title isEqualToString:expectedResult], @"Initial button title %@ is not a %@", expectedResult, title);
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end

