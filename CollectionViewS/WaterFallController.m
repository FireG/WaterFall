//
//  WaterFallController.m
//  CollectionViewS
//
//  Created by guozihui on 16/12/15.
//  Copyright © 2016年 guozihui. All rights reserved.
//

#import "WaterFallController.h"
#import "WaterFallLayout.h"
#import "ShopModel.h"

@interface WaterFallController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSArray *shops;
@end

#define RColor (arc4random()%255)+1

@implementation WaterFallController

-(instancetype)init{
    
    if (self = [super init]){
        
        self.navigationItem.title = @"WaterFallController";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WaterFallLayout *waterFallLayout = [[WaterFallLayout alloc]init];
    waterFallLayout.shops = self.shops;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:waterFallLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"waterCell"];
    
    [self.view addSubview:collectionView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.shops.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"waterCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
    
}

-(NSArray *)shops{
    if (!_shops){
        NSArray *arrays = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"shop.plist" ofType:nil]];
        NSMutableArray *muarrays = [NSMutableArray array];
        for (NSDictionary *dict in arrays) {
            ShopModel *shop = [ShopModel modelWithDictionary:dict];
            [muarrays addObject:shop];
        }
        self.shops = muarrays;
    }
    return _shops;
}


@end
