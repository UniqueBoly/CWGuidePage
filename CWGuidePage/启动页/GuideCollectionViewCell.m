//
//  GuideCollectionViewCell.m
//  CWGuidePage
//
//  Created by 吴波 on 2017/3/14.
//  Copyright © 2017年 wubo. All rights reserved.
//

#import "GuideCollectionViewCell.h"

@implementation GuideCollectionViewCell

- (instancetype)init
{
    if (self = [super init]) {
        [self commonUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonUI];
    }
    return self;
}

- (void)commonUI
{
    [self.contentView addSubview:self.guideImage];
    [self.contentView addSubview:self.beginBtn];
}

- (UIButton *)beginBtn
{
    if (!_beginBtn) {
        _beginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _beginBtn.backgroundColor = [UIColor clearColor];
        [_beginBtn setTitle:@"开始体验" forState:UIControlStateNormal];
        _beginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_beginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _beginBtn.layer.borderWidth = 1.0;
        _beginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _beginBtn;
}

- (UIImageView *)guideImage
{
    if (!_guideImage) {
        _guideImage = [[UIImageView alloc] init];
        _guideImage.contentMode = UIViewContentModeScaleToFill;
    }
    return _guideImage;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.guideImage.frame = self.contentView.bounds;
    
    [self.beginBtn sizeToFit];
    CGFloat margin = 10.0f;
    
    CGFloat btnWidth = self.beginBtn.frame.size.width + 2 * margin;
    CGFloat btnHeight = self.beginBtn.frame.size.height;
    CGFloat btnX = (self.frame.size.width - btnWidth) / 2;
    CGFloat btnY = self.frame.size.height - 75.0f - btnHeight;
    
    self.beginBtn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
}


@end
