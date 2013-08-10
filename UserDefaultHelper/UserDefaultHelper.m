//
//  UserDefaultHelper.m
//  UserDefaultHelper
//
//  Created by Jonah "The administrator" Hooper on 8/10/13.
//  Copyright (c) 2013 Jonah "The administrator" Hooper. All rights reserved.
//

#import "UserDefaultHelper.h"

@implementation UserDefaultHelper

+(BOOL) objectExists:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key] != nil;
}

+(void) saveToStandardDefaultsWithBlock:(UserDefaultsSaveBlock) saveFunction {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    saveFunction(defaults);
    [defaults synchronize];
}

+(void) saveObjectForKey:(NSString *)key object:(id)item {
    void (^saveBlock) (NSUserDefaults*) = [UserDefaultHelper saveFunctionForKey:key object:item];
    [self saveToStandardDefaultsWithBlock:saveBlock];
}

+(UserDefaultsSaveBlock) saveFunctionForKey:(NSString *) key object:(id) item {
    return ^(NSUserDefaults *defaults){
        if ([item isKindOfClass:[NSURL class]]) {
            [defaults setURL:item forKey:key];
        } else if ([item isKindOfClass:[NSValue class]]) {
            NSValue *_item = item;
            const char* itemType = (const char*)[_item objCType];
            if (strcmp(itemType, @encode(float)) == 0) {
                float buffer;
                [_item getValue:&buffer];
                [defaults setFloat:buffer forKey:key];
            } else if (strcmp(itemType, @encode(double)) == 0) {
                double buffer;
                [_item getValue:&buffer];
                [defaults setDouble:buffer forKey:key];
            } else if (strcmp(itemType, @encode(int)) == 0) {
                int buffer;
                [_item getValue:&buffer];
                [defaults setInteger:buffer forKey:key];
            } else if (strcmp(itemType, @encode(BOOL)) == 0) {
                BOOL buffer;
                [_item getValue:&buffer];
                [defaults setBool: buffer forKey:key];
            } else {
                [defaults setValue:item forKey:key];
            }
        } else {
            [defaults setObject:item forKey:key];
        }
    };
}

+(id) objectAtKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

+(void) saveDictionary:(NSDictionary *)dictionary {
    [UserDefaultHelper saveToStandardDefaultsWithBlock:^(NSUserDefaults *defaults)  {
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
            UserDefaultsSaveBlock saveBlock = [UserDefaultHelper saveFunctionForKey:key object:value];
            saveBlock(defaults);
        }];
    }];
}

+(void) resetStandardUserDefaults {
    NSString *domainName = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];
}


@end
