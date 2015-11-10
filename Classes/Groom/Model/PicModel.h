//
//  PicModel.h
//  suishenkan
//
//  Created by Jefferson on 15/11/8.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicModel : NSObject

@property (nonatomic, copy) NSString *serverLocalPath;

+ (instancetype)picWithDict:(NSDictionary *)dict;

@end
