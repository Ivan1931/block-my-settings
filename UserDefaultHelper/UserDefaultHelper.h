//
//  UserDefaultHelper.h
//  UserDefaultHelper
//
//  Created by Jonah "The administrator" Hooper on 8/10/13.
//  Copyright (c) 2013 Jonah "The administrator" Hooper. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^UserDefaultsSaveBlock) (NSUserDefaults*);

@interface UserDefaultHelper : NSObject

+(BOOL) objectExists:(NSString *) key;
//Send through a block with the save function to save to Standard NSUserDefaults
+(void) saveToStandardDefaultsWithBlock:(UserDefaultsSaveBlock)saveFunction;
//Primitives must be rapped in NSValues to utilise this function
+(void) saveObjectForKey:(NSString *) key object:(id) item;
+(id) objectAtKey:(NSString *)key;
+(void) saveDictionary:(NSDictionary *) dictionary;
+(void) resetStandardUserDefaults;
+(UserDefaultsSaveBlock) saveFunctionForKey:(NSString *) key object:(id) item;

@end
