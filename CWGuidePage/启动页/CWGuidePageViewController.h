//
//  CWGuidePageViewController.h
//  CWGuidePage
//
//  Created by 吴波 on 2017/3/14.
//  Copyright © 2017年 wubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuideCollectionViewCell.h"

//两个block,用来显示引导页图片和处理最后按钮事件
typedef void(^setImageBlock)(NSIndexPath *indexPath, GuideCollectionViewCell *cell); //传递cell和当前item的索引
typedef void(^beginBlock)(UIButton *button);

@interface CWGuidePageViewController : UIViewController

//重新init方法，传入引导页面的个数
- (instancetype)initWithPagesCount:(NSInteger)count setImage:(setImageBlock)setImageBlock begin:(beginBlock)beginBlock;

@property (nonatomic , strong) UICollectionView *guideCollectionView;
@property (nonatomic , strong) UIPageControl *pageControl;

@property (nonatomic , assign) NSInteger count;

@end
