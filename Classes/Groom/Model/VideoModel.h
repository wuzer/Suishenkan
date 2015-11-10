//
//  VideoModel.h
//  suishenkan
//
//  Created by Jefferson on 15/11/8.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PicModel;

@interface VideoModel : NSObject

@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, copy) NSString *remark;
//@property (nonatomic, copy) NSString *serverLocalPath;
@property (nonatomic, strong) NSArray *poster;
//@property (nonatomic, strong) PicModel *pic;

- (instancetype)initWithDict:(NSDictionary *)dict;
//
+ (instancetype)videoWithDict:(NSDictionary *)dict;

@end
