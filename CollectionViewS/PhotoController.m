//
//  PhotoController.m
//  CollectionViewS
//
//  Created by guozihui on 16/12/15.
//  Copyright © 2016年 guozihui. All rights reserved.
//

#import "PhotoController.h"
#import "PhotoLayout.h"


@interface PhotoController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation PhotoController

-(instancetype)init{
    
    if (self = [super init]){
    
        self.navigationItem.title = @"PhotoController";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    PhotoLayout *photoLayout = [[PhotoLayout alloc]init];
    
    CGRect collectionBounce = CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.width*0.6);
    UICollectionView *collectioView = [[UICollectionView alloc]initWithFrame:collectionBounce collectionViewLayout:photoLayout];
    collectioView.delegate = self;
    collectioView.dataSource = self;
    [collectioView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"photoCell"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectioView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}



@end
