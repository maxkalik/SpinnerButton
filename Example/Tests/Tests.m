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

-(void)testTitle:(NSString*)expectedTitle
{
    NSString *title = self.button.currentTitle;
    XCTAssertTrue([title isEqualToString:expectedTitle], @"Button title %@ is not equal to %@", expectedTitle, title);
}

- (void)testInitialTitle
{
    [self testTitle:@"Spinner Button"];
}

- (void)testCustomTitle
{
    NSString *customTitle = @"Test Title";
    [self.button setTitle:customTitle forState:UIControlStateNormal];
    [self testTitle:customTitle];
}

- (void)testStrokeLineWidth:(NSNumber*)expectedLineWidth
{
    NSNumber *strokeLineWidth = self.button.strokeLineWidth;
    XCTAssertTrue([strokeLineWidth isEqualToNumber:expectedLineWidth], @"Initial button stroke should be equal %@, but got %@", strokeLineWidth, expectedLineWidth);
}

- (void)testInitialStrokeLineWidth
{
    [self testStrokeLineWidth:@5];
}

- (void)testCustomStrokeLineWidth
{
    NSNumber *strokeLineWidth = @3;
    [self.button setStrokeLineWidth:strokeLineWidth];
    [self testStrokeLineWidth:strokeLineWidth];
}

- (void)testInitialTimeInterval
{
    CFTimeInterval timeInterval = self.button.timeInterval;
    CFTimeInterval expectedResult = 1.5;
    XCTAssertTrue(timeInterval == expectedResult, @"Initial button animation time interval %f is not equal to %f", expectedResult, timeInterval);
}

- (void)testLoadingState
{
    [self.button startAnimating];
    XCTAssertTrue(self.button.loading);
    
    [self.button stopAnimating];
    XCTAssertFalse(self.button.loading);
}

@end

