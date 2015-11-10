//
//  VideoModel.m
//  suishenkan
//
//  Created by Jefferson on 15/11/8.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "VideoModel.h"
#import "NSObject+JFExtension.h"
#import "MJExtension.h"
#import "PicModel.h"

@implementation VideoModel


- (instancetype)initWithDict:(NSDictionary *)dict {
    
    VideoModel *video = [[VideoModel alloc] init];
    [video setValuesForKeysWithDictionary:dict];
    
            NSArray *array = dict[@"poster"];
            
            NSMutableArray *tempArray = [NSMutableArray array];
            
            for (NSDictionary *dict in array) {
                [tempArray addObject:[PicModel picWithDict:dict]];
            }
            video.poster = tempArray.copy;
    return video;
}


+ (instancetype)videoWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}



@end
