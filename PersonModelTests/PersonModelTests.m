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

/**
 XCTest提供了XCTestExpectation来进行异步测试，即可在指定时机使用其fulfill实例方法开始执行断言命令。例如以下是一个完整的网络请求的测试样例，可用于测试server端是否正常，要在对应的block中进行断言
 */
- (void)testAsynchronousURLConnection {
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Baidu"];
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // XCTestExpectation条件已满足，接下来的测试可以执行了。
        [expectation fulfill];
        XCTAssertNotNil(data, @"返回数据不应非nil");
        XCTAssertNil(error, @"error应该为nil");
        if (nil != response) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            XCTAssertEqual(httpResponse.statusCode, 200, @"HTTPResponse的状态码应该是200");
            XCTAssertEqual(httpResponse.URL.absoluteString, url.absoluteString, @"HTTPResponse的URL应该与请求的URL一致");
        } else {
            XCTFail(@"返回内容不是NSHTTPURLResponse类型");
        }
    }];
    [task resume];
    
    // 超时后执行
    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        [task cancel];
    }];
}
@end










