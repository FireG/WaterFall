//
//  WaterFallLayout.m
//  CollectionViewS
//
//  Created by guozihui on 16/12/16.
//  Copyright © 2016年 guozihui. All rights reserved.
//

#import "WaterFallLayout.h"

#define Column 3
#define Marin 10


@interface WaterFallLayout()

@property (nonatomic,strong)NSMutableArray *positions;

@end

@implementation WaterFallLayout


-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    ShopModel *shop = self.shops[indexPath.row];
    CGFloat width = (self.collectionView.bounds.size.width - (Column+1)*10)/Column;
    CGFloat height = shop.h / shop.w  * width;
    
    CGFloat minY = [self.positions[0] doubleValue];
    int minColumn = 0;
    for (int i = 0; i < Column; i++){
        CGFloat currentY = [self.positions[i] doubleValue];
        if (minY>currentY){
            minY = currentY;
            minColumn = i;
        }
    }
    
    CGFloat minX = Marin + (width+Marin) * minColumn;
    
    attr.frame = CGRectMake(minX, minY+10, width, height);

    
    
    self.positions[minColumn] = @(CGRectGetMaxY(attr.frame));
    
    
    return attr;
}

-(CGSize)collectionViewContentSize{
    
    if (self.positions.count==0){
        return CGSizeZero;
    }
    
    CGFloat maxY = [self.positions[0] doubleValue];
    
    for (int i = 0; i < Column; i++) {
        CGFloat currentY = [self.positions[i] doubleValue];
        
        if (maxY < currentY) {
            maxY = currentY;
        }
    }
    
    return CGSizeMake(0, maxY + 10);
    
    
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    for (int i = 0; i<Column; i++) {
        self.positions[i] = @"0";
    }
    
    
    NSInteger cows = [self.collectionView numberOfItemsInSection:0];
    
    NSMutableArray *muarr = [NSMutableArray array];
    
    for(int i = 0; i<cows; i++){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [muarr addObject:attr];
    }
    return muarr;
}

-(void)prepareLayout{
    self.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 10, 0);
}
-(NSMutableArray *)positions{
    if(!_positions){
        _positions = [NSMutableArray array];
    }
    return _positions;
}



@end
