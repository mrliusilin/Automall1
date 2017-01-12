//
//  PreferenceCollectionViewLayout.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/30.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "PreferenceCollectionViewLayout.h"

@implementation PreferenceCollectionViewLayout

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    UICollectionView * collectionView = self.collectionView;
    attr.size = self.itemSize;
    return attr;
}

@end
