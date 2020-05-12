# CWGuidePage
## 一款很简单的APP引导页，可定制性高
使用方法，将文件拖入工程项目中，在 didFinishLaunchingWithOptions 中添加如下代码
    
    CWGuidePageViewController *guidePage = [[CWGuidePageViewController alloc] initWithPagesCount:3 setImage:^(NSIndexPath *indexPath, GuideCollectionViewCell *cell) {
        //这里也可以加载网络图片
        NSString *imageName = [NSString stringWithFormat:@"启动页%ld", indexPath.row + 1];
        cell.guideImage.image = [UIImage imageNamed:imageName];
    } begin:^(UIButton *button) {
        //添加进入主页的动画，可以根据项目需求来添加相应的动画
        CATransition *transition = [CATransition new];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFromRight;
        
        ViewController *vc = [ViewController new];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        self.window.rootViewController = nav;
        [self.window.layer addAnimation:transition forKey:@"animation"];
    }];
    
    //这里可以设置pageControl的颜色
    guidePage.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    guidePage.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    self.window.rootViewController = guidePage;
    [self.window makeKeyAndVisible];
