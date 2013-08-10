//
//  UserDefaultHelperTests.h
//  UserDefaultHelperTests
//
//  Created by Jonah "The administrator" Hooper on 8/10/13.
//  Copyright (c) 2013 Jonah "The administrator" Hooper. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "UserDefaultHelper.h"

@interface UserDefaultHelperTests : SenTestCase {
    
    NSString *stringValue;
    float floatValue;
    int intValue;
    double doubleValue;
    BOOL boolValue;
    
    NSString *doubleKey;
    NSString *floatKey;
    NSString *intKey;
    NSString *boolKey;
    NSString *stringKey;
}

@end
