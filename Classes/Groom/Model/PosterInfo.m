//
//  PosterInfo.m
//  suishenkan
//
//  Created by Jefferson on 15/11/9.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "PosterInfo.h"

@implementation PosterInfo

+ (instancetype)PosterInfoWithDict:(NSDictionary *)dict {
    
    PosterInfo *post = [[PosterInfo alloc] init];
    [post setValuesForKeysWithDictionary:dict];
    return post;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

@end
