//
//  PhotoLayout.m
//  CollectionViewS
//
//  Created by guozihui on 16/12/15.
//  Copyright © 2016年 guozihui. All rights reserved.
//

#import "PhotoLayout.h"

@implementation PhotoLayout



-(void)prepareLayout{
    self.itemSize = CGSizeMake(self.collectionView.bounds.size.height*0.6, self.collectionView.bounds.size.height);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat center = ABS(self.collectionView.bounds.size.width - self.itemSize.width)/2;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, center, 0, center);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat layoutCenter = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width/2;
    
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        CGFloat currentP  = ABS(layoutCenter - attr.center.x);
        CGFloat scaleP = 1 - currentP/self.collectionView.bounds.size.width/2;
        attr.transform = CGAffineTransformMakeScale(scaleP, scaleP);
    }
    return attrs;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    CGFloat screenCenter = self.collectionView.bounds.size.width/2 + proposedContentOffset.x;
    CGRect visibleCGRect = CGRectZero;
    visibleCGRect.origin = proposedContentOffset;
    visibleCGRect.size = self.collectionView.bounds.size;
    NSArray *attrs = [self layoutAttributesForElementsInRect:visibleCGRect];
    CGFloat max = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        
        CGFloat margin = screenCenter - attr.center.x;
        if(ABS(max)>ABS(margin)){
            max = margin;
        }
        
        
        
    }
    
    
    return CGPointMake(proposedContentOffset.x-max, 0);
}



-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}


@end
