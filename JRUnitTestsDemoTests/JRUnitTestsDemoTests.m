//
//  JRUnitTestsDemoTests.m
//  JRUnitTestsDemoTests
//
//  Created by lujianrong on 16/6/14.
//  Copyright © 2016年 JR. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface JRUnitTestsDemoTests : XCTestCase

@end

@implementation JRUnitTestsDemoTests

- (void)setUp {
    [super setUp];
    
    /**
     *  每个 test方法执行之前调用
     */
}

- (void)tearDown {
    [super tearDown];
    
    /**
     *  每个 test 方法执行之后调用
     */
}

- (void)testExample {
    /**
     *  命名为 Examp 的测试方法
     */
}

- (void)testPerformanceExample {
    /**
     *  主要检测代码的执行性能
     */
    [self measureBlock:^{
       
    }];
}
/**
 自定义测试方法必须以test方法名开头(testXXX)，例如上面的testExample
 
 自定义方法必须为void返回类型
 */
- (void)testFloatEqual {
    NSLog(@"\n 这是自定义的测试方法");
    float a = 100.00;
    XCTAssertEqual(a, 100, @"不相等");
}

@end
