//
//  _2__UIButtonDemoTests.m
//  02- UIButtonDemoTests
//
//  Created by qingyun on 15/11/9.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface _2__UIButtonDemoTests : XCTestCase

@end

@implementation _2__UIButtonDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
