//
//  UserDefaultHelperTests.m
//  UserDefaultHelperTests
//
//  Created by Jonah "The administrator" Hooper on 8/10/13.
//  Copyright (c) 2013 Jonah "The administrator" Hooper. All rights reserved.
//

#import "UserDefaultHelperTests.h"

@implementation UserDefaultHelperTests

- (void)setUp
{
    [super setUp];
    floatValue = 0.1f;
    boolValue = NO;
    stringValue = @"Hello World";
    
    floatKey = @"float";
    boolKey = @"bool";
    stringKey = @"string";
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    //STAssertNoThrow([UserDefaultHelper resetStandardUserDefaults], @"Should clear NSUserDefaults without a problem");
    
    STAssertNil([UserDefaultHelper objectAtKey:boolKey], @"No Object has been saved so a nil value must be returned");
    NSValue *boolWrap = [NSValue value:&boolValue withObjCType:@encode(BOOL)];
    [UserDefaultHelper saveObjectForKey:boolKey object:boolWrap];
    STAssertNotNil([UserDefaultHelper objectAtKey:stringKey], @"Should return the bool value that has just been saved");
    STAssertTrue([[UserDefaultHelper objectAtKey:boolKey] isEqual:boolWrap], @"Object has been saved and returned as an NSValue");
    //Time to save an object
    STAssertNil([UserDefaultHelper objectAtKey:stringKey], @"Nothing saved so nothing is returned");
    [UserDefaultHelper saveObjectForKey:stringKey object:stringKey];
    STAssertNotNil([UserDefaultHelper objectAtKey:stringKey], @"Should return the string value that has just been saved");
    STAssertTrue([[UserDefaultHelper objectAtKey:stringKey] isEqual:stringValue], @"Object has beens saved and now should be returned");
    
}

@end
