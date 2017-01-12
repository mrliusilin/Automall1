//
//  TitleAndCollectionView.h
//  Automall
//
//  Created by 刘思麟 on 2016/12/30.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleAndCollectionView : UIView

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


//@property(nonatomic,copy)NSString * title;
//
//@property(nonatomic,assign)float collectionViewHeight;
//
//@property(nonatomic,strong)id<UICollectionViewDelegate> collectionViewDelegate;
//
//@property(nonatomic,strong)id<UICollectionViewDataSource> collectionViewDataSource;
//
//@property(nonatomic,strong)UICollectionViewLayout * collectionViewLayout;
//
//-(void)regiseterCollectionViewCellWithClass:(Class)cellClass reuseIdentifier:(NSString*)identifier;

@end
