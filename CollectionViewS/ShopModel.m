//
//  ShopModel.m
//  CollectionViewS
//
//  Created by guozihui on 16/12/16.
//  Copyright © 2016年 guozihui. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel

-(instancetype)initWithDictionary:(NSDictionary*)dict{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)modelWithDictionary:(NSDictionary*)dict{
    return [[self alloc]initWithDictionary:dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    NSLog(@"%s,%@",__func__,key);
}

@end
