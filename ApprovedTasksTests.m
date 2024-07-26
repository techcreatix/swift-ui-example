//
//  ApprovedTasksTests.m
//  VeqtrTests
//
//  Created by Eman Tahir on 26/07/2024.
//  Copyright © 2024 Dima Bart. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VASession.h"
#import "DBClient.h"
#import <OCMock/OCMock.h>
#import "VAVenueSummary.h"

@interface ApprovedTasksTests : XCTestCase
@property (nonatomic, strong) VASession *vaSession;
@end

@implementation ApprovedTasksTests

- (void)setUp {
    [super setUp];
    self.vaSession = [[VASession alloc] init];
}

- (void)tearDown {
    self.vaSession = nil;
    [super tearDown];
}

- (void)testFetchApprovedTasksUser_withNilResults {
    id dbClientMock = OCMClassMock([DBClient class]);
    OCMStub([dbClientMock sharedClient]).andReturn(dbClientMock);
    OCMStub([dbClientMock genericGETmethod:[OCMArg any] andFunctionURL:[OCMArg any] withIgnoreNotifications:NO completion:([OCMArg invokeBlockWithArgs:nil, [NSNull null], nil])]);

    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with an empty array"];
    
    [self.vaSession fetchApprovedTasksUser:^(NSMutableArray *results) {
        XCTAssertEqual(results.count, 0);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    [dbClientMock stopMocking];
}

- (void)testFetchApprovedTasksUser_withValidResults {
    id dbClientMock = OCMClassMock([DBClient class]);
    OCMStub([dbClientMock sharedClient]).andReturn(dbClientMock);
    
    NSDictionary *mockVenue1 = @{@"id": @"1", @"title": @"Venue 1"};
    NSDictionary *mockVenue2 = @{@"id": @"2", @"title": @"Venue 2"};
    NSArray *mockVenues = @[mockVenue1, mockVenue2];
    NSDictionary *mockResults = @{@"success": @YES, @"venues": mockVenues};
    
    OCMStub([dbClientMock genericGETmethod:[OCMArg any] andFunctionURL:[OCMArg any] withIgnoreNotifications:NO completion:([OCMArg invokeBlockWithArgs:mockResults, [NSNull null], nil])]);

    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with a valid array"];
    
    [self.vaSession fetchApprovedTasksUser:^(NSMutableArray *results) {
        XCTAssertEqual(results.count, 2);
        XCTAssertEqualObjects(((VAVenueSummary *)results[0]).title, @"Venue 1");
        XCTAssertEqualObjects(((VAVenueSummary *)results[1]).title, @"Venue 2");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    [dbClientMock stopMocking];
}

- (void)testFetchApprovedTasksUser_withError {
    id dbClientMock = OCMClassMock([DBClient class]);
    OCMStub([dbClientMock sharedClient]).andReturn(dbClientMock);
    OCMStub([dbClientMock genericGETmethod:[OCMArg any] andFunctionURL:[OCMArg any] withIgnoreNotifications:NO completion:([OCMArg invokeBlockWithArgs:nil, [NSError errorWithDomain:@"test" code:123 userInfo:nil], nil])]);

    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion should be called with an empty array on error"];
    
    [self.vaSession fetchApprovedTasksUser:^(NSMutableArray *results) {
        XCTAssertEqual(results.count, 0);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    [dbClientMock stopMocking];
}

@end
