//
//  CWGuidePageViewController.m
//  CWGuidePage
//
//  Created by 吴波 on 2017/3/14.
//  Copyright © 2017年 wubo. All rights reserved.
//

#import "CWGuidePageViewController.h"

@interface CWGuidePageViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

@property (nonatomic , copy) setImageBlock setImage;
@property (nonatomic , copy) beginBlock begin;

@end

static NSString * const CWGuideCellId = @"Guide";

@implementation CWGuidePageViewController

- (instancetype)initWithPagesCount:(NSInteger)count setImage:(setImageBlock)setImageBlock begin:(beginBlock)beginBlock
{
    if (self = [super init]) {
        _count = count;
        _setImage = [setImageBlock copy];
        _begin = [beginBlock copy];
        [self.view addSubview:self.guideCollectionView];
        [self.view addSubview:self.pageControl];
        [self.guideCollectionView registerClass:[GuideCollectionViewCell class] forCellWithReuseIdentifier:CWGuideCellId];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 懒加载

- (UICollectionView *)guideCollectionView
{
    if (!_guideCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //item大小
        layout.itemSize = self.view.bounds.size;
        layout.minimumLineSpacing = 0.0f;
        layout.minimumInteritemSpacing = 0.0f;
        
        _guideCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _guideCollectionView.delegate = self;
        _guideCollectionView.dataSource = self;
        _guideCollectionView.bounces = NO;
        _guideCollectionView.pagingEnabled = YES;
        _guideCollectionView.showsHorizontalScrollIndicator = NO;
    }
    return _guideCollectionView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = self.count;
        _pageControl.currentPage = 0;
        CGSize pageControlSize = [_pageControl sizeForNumberOfPages:self.count];
        
        CGFloat pageControlX = (self.view.bounds.size.width - pageControlSize.width) / 2;
        CGFloat pageControlY = self.view.bounds.size.height - pageControlSize.height - 20.0f;
        _pageControl.frame = CGRectMake(pageControlX, pageControlY, pageControlSize.width, pageControlSize.height);
    }
    return _pageControl;
}


#pragma mark - 数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GuideCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CWGuideCellId forIndexPath:indexPath];
    if (indexPath.row != self.count - 1) {
        cell.beginBtn.hidden = YES;
    } else {
        cell.beginBtn.hidden = NO;
        [cell.beginBtn addTarget:self action:@selector(beginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (self.setImage) {
        self.setImage(indexPath , cell);
    }
    return cell;
}

- (void)beginClick:(UIButton *)button
{
    if (self.begin) {
        self.begin(button);
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    if (self.pageControl.currentPage != currentPage) {
        self.pageControl.currentPage = currentPage;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
