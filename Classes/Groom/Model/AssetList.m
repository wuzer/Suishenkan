//
//  AssetList.m
//  suishenkan
//
//  Created by Jefferson on 15/11/9.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "AssetList.h"
#import "PosterInfo.h"

@implementation AssetList

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    AssetList *list = [[AssetList alloc] init];
    [list setValuesForKeysWithDictionary:dict];
    
    NSArray *array = dict[@"posterInfo"];
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [tempArray addObject:[PosterInfo PosterInfoWithDict:dict]];
    }
    list.posterInfo = tempArray.copy;
    
    return list;
}

+ (instancetype)AssetListWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

@end
