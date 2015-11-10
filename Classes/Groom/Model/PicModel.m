//
//  PicModel.m
//  suishenkan
//
//  Created by Jefferson on 15/11/8.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "PicModel.h"

@implementation PicModel

+ (instancetype)picWithDict:(NSDictionary *)dict {
    
    PicModel *pic = [[PicModel alloc] init];
    [pic setValuesForKeysWithDictionary:dict];
    return pic;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}

//- (NSString *)description {
//
//    return [self dictionaryWithValuesForKeys:@[@"serverLocalPath"]].description;
//}


@end
