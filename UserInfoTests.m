//
//  UserInfoTests.m
//  VeqtrTests
//
//  Created by Eman Tahir on 26/07/2024.
//  Copyright © 2024 Dima Bart. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VASession.h"
#import "DBClient.h"
#import <OCMock/OCMock.h>
#import "VAUser.h"

@interface VeqtrUserInfoTests : XCTestCase
@property (nonatomic, strong) VASession *vaSession;
@end

@implementation VeqtrUserInfoTests

- (void)setUp {
    [super setUp];
    self.vaSession = [[VASession alloc] init];
}

- (void)tearDown {
    self.vaSession = nil;
    [super tearDown];
}

- (void)testFetchUserInfoWithIDUsernameCompletion_withNilCompletion {
    [self.vaSession fetchUserInfoWithID:@"userID" username:@"username" completion:nil];
    // No assertion needed, just ensuring no crash
}

- (void)testFetchUserInfoWithIDUsernameCompletion_withNilUserID {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with NO"];
    
    [self.vaSession fetchUserInfoWithID:nil username:@"username" completion:^(BOOL success, VAUser *user) {
        XCTAssertFalse(success);
        XCTAssertNil(user);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
}

- (void)testFetchUserInfoWithIDUsernameCompletion_withValidUserIDAndNilUsername {
    id dbClientMock = OCMClassMock([DBClient class]);
    OCMStub([dbClientMock sharedClient]).andReturn(dbClientMock);
    OCMStub([dbClientMock genericGETmethod:[OCMArg any] andFunctionURL:[OCMArg any] withIgnoreNotifications:NO completion:([OCMArg invokeBlockWithArgs:@{@"user": @{@"id": @"userID", @"name": @"User Name"}}, [NSNull null], nil])]);

    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with YES and valid user"];
    
    [self.vaSession fetchUserInfoWithID:@"userID" username:nil completion:^(BOOL success, VAUser *user) {
        XCTAssertTrue(success);
        XCTAssertNotNil(user);
        XCTAssertEqualObjects(user.userID, @"userID");
        XCTAssertEqualObjects(user.name, @"User Name");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    [dbClientMock stopMocking];
}

- (void)testFetchUserInfoWithIDUsernameCompletion_withValidUserIDAndUsername {
    id dbClientMock = OCMClassMock([DBClient class]);
    OCMStub([dbClientMock sharedClient]).andReturn(dbClientMock);
    OCMStub([dbClientMock genericGETmethod:[OCMArg any] andFunctionURL:[OCMArg any] withIgnoreNotifications:NO completion:([OCMArg invokeBlockWithArgs:@{@"user": @{@"id": @"userID", @"name": @"User Name"}}, [NSNull null], nil])]);

    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with YES and valid user"];
    
    [self.vaSession fetchUserInfoWithID:@"userID" username:@"username" completion:^(BOOL success, VAUser *user) {
        XCTAssertTrue(success);
        XCTAssertNotNil(user);
        XCTAssertEqualObjects(user.userID, @"userID");
        XCTAssertEqualObjects(user.name, @"User Name");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    [dbClientMock stopMocking];
}

- (void)testFetchUserInfoWithIDUsernameCompletion_withError {
    id dbClientMock = OCMClassMock([DBClient class]);
    OCMStub([dbClientMock sharedClient]).andReturn(dbClientMock);
    OCMStub([dbClientMock genericGETmethod:[OCMArg any] andFunctionURL:[OCMArg any] withIgnoreNotifications:NO completion:([OCMArg invokeBlockWithArgs:nil, [NSError errorWithDomain:@"test" code:123 userInfo:nil], nil])]);

    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with NO on error"];
    
    [self.vaSession fetchUserInfoWithID:@"userID" username:@"username" completion:^(BOOL success, VAUser *user) {
        XCTAssertFalse(success);
        XCTAssertNil(user);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    [dbClientMock stopMocking];
}

@end
