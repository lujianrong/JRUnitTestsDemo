//
//  PersonModelTests.m
//  PersonModelTests
//
//  Created by lujianrong on 16/6/14.
//  Copyright © 2016年 JR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PersonModel.h"
#import "UIImage+ScaleTool.h"
@interface PersonModelTests : XCTestCase

@end

@implementation PersonModelTests
/**
 *  每个 test方法执行之前调用
 */
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

/**
 *  每个 test 方法执行之后调用
 */
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 *  命名为 Example 的测试方法
 */
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

/**
 *  这个里面测试性能
 */
- (void)testPerformanceExample {
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSString *path = [[NSBundle mainBundle] pathForResource:@"IMG_0520" ofType:@"JPG"];
        UIImage *originImage = [[UIImage alloc] initWithContentsOfFile:path];
        UIImage *scaledImage = [originImage scaleToSize:CGSizeMake(120, 160)];
        XCTAssertEqual(scaledImage.size.width == 120., scaledImage.size.height==160., @"压缩正确!");
    }];
}

/**
 *  File - > New -> Target -> Test -> iOS Unit Testing Bundle
 */
- (void)testPersonModelName {
    PersonModel *model = [[PersonModel alloc] init];
    XCTAssertEqualObjects(model.name, @"JRUnitTestsDemo", @"和预想的不一样!");
}

- (void)testImageScaledSize {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"IMG_0520" ofType:@"JPG"];
    UIImage *originImage = [[UIImage alloc] initWithContentsOfFile:path];
    UIImage *scaledImage = [originImage scaleToSize:CGSizeMake(120, 160)];
    XCTAssertEqual(scaledImage.size.width == 120., scaledImage.size.height==160., @"压缩不正确!");
}
@end
