//
//  SessionTests.m
//  VeqtrTests
//
//  Created by Eman Tahir on 26/07/2024.
//  Copyright © 2024 Dima Bart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "VASession.h"
#import "DBClient.h"
#import <OCMock/OCMock.h>

@interface SessionTests : XCTestCase
@property (nonatomic, strong) VASession *vaSession;
@end

@implementation SessionTests

- (void)setUp {
    [super setUp];
    self.vaSession = [[VASession alloc] init];
}

- (void)tearDown {
    self.vaSession = nil;
    [super tearDown];
}

- (void)testFetchTokenWithUsernamePasswordCompletion_withNilUsername {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with NO"];
    
    [self.vaSession fetchTokenWithUsername:nil password:@"password" completion:^(BOOL success) {
        XCTAssertFalse(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
}

- (void)testFetchTokenWithUsernamePasswordCompletion_withNilPassword {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with NO"];
    
    [self.vaSession fetchTokenWithUsername:@"username" password:nil completion:^(BOOL success) {
        XCTAssertFalse(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
}

- (void)testFetchTokenWithUsernamePasswordCompletion_withValidCredentials {
    id dbClientMock = OCMClassMock([DBClient class]);
    OCMStub([dbClientMock sharedClient]).andReturn(dbClientMock);
    OCMStub([dbClientMock genericPOSTmethod:[OCMArg any] andFunctionURL:[OCMArg any] withIgnoreNotifications:YES completion:([OCMArg invokeBlockWithArgs:@{@"token": @"dummyToken"}, [NSNull null], nil])]);

    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with YES"];
    
    [self.vaSession fetchTokenWithUsername:@"username" password:@"password" completion:^(BOOL success) {
        XCTAssertTrue(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    [dbClientMock stopMocking];
}

- (void)testFetchTokenWithUsernamePasswordCompletion_withError {
    id dbClientMock = OCMClassMock([DBClient class]);
    OCMStub([dbClientMock sharedClient]).andReturn(dbClientMock);
    OCMStub([dbClientMock genericPOSTmethod:[OCMArg any] andFunctionURL:[OCMArg any] withIgnoreNotifications:YES completion:([OCMArg invokeBlockWithArgs:nil, [NSError errorWithDomain:@"test" code:123 userInfo:nil], nil])]);

    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with NO"];
    
    [self.vaSession fetchTokenWithUsername:@"username" password:@"password" completion:^(BOOL success) {
        XCTAssertFalse(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    [dbClientMock stopMocking];
}

@end
