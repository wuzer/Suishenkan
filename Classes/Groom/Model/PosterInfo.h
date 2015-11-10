//
//  PosterInfo.h
//  suishenkan
//
//  Created by Jefferson on 15/11/9.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PosterInfo : NSObject

@property (nonatomic, copy) NSString *serverLocalPath;

+ (instancetype)PosterInfoWithDict:(NSDictionary *)dict;

@end
