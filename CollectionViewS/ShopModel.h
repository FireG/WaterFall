//
//  ShopModel.h
//  CollectionViewS
//
//  Created by guozihui on 16/12/16.
//  Copyright © 2016年 guozihui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShopModel : NSObject

@property(nonatomic,assign) CGFloat w;
@property(nonatomic,assign) CGFloat h;

+(instancetype)modelWithDictionary:(NSDictionary*)dict;

@end
