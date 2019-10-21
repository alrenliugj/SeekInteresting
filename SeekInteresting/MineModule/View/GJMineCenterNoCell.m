//
//  GJMineCenterNoCell.m
//  SeekInteresting
//
//  Created by Arlenly on 2019/10/21.
//  Copyright © 2019年 LiuGJ. All rights reserved.
//

#import "GJMineCenterNoCell.h"

@interface GJMineCenterNoCell ()

@property (nonatomic, strong) GJCustomNoButton *loginBtn;
@property (nonatomic, strong) UIButton *mineBtn;

@property (nonatomic, strong) GJCustomNoButton *likesBtn;
@property (nonatomic, strong) GJCustomNoButton *starBtn;
@property (nonatomic, strong) GJCustomNoButton *historyBtn;
@end

@implementation GJMineCenterNoCell

- (void)loginBtnClick {
    BLOCK_SAFE(_blockClickLogin)();
}

- (void)likesBtnClick {
    BLOCK_SAFE(_blockClickLogin)();
}

- (void)starBtnClick {
    BLOCK_SAFE(_blockClickLogin)();
}

- (void)historyBtnClick {
    BLOCK_SAFE(_blockClickLogin)();
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _loginBtn = [[GJCustomNoButton alloc] init];
        _loginBtn.title = @"点击登录";
        _loginBtn.image = @"默认头像";
        _loginBtn.image_edge = AdaptatSize(100);
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _likesBtn = [[GJCustomNoButton alloc] init];
        _likesBtn.title = @"我喜欢的";
        _likesBtn.image = @"我喜欢";
        [_likesBtn addTarget:self action:@selector(likesBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _starBtn = [[GJCustomNoButton alloc] init];
        _starBtn.title = @"我的点赞";
        _starBtn.image = @"点赞";
        [_starBtn addTarget:self action:@selector(starBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _historyBtn = [[GJCustomNoButton alloc] init];
        _historyBtn.title = @"历史浏览";
        _historyBtn.image = @"历史浏览";
        [_historyBtn addTarget:self action:@selector(historyBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_loginBtn];
        [self addSubview:_likesBtn];
        [self addSubview:_starBtn];
        [self addSubview:_historyBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).with.offset(-AdaptatSize(40));
        make.width.mas_equalTo(AdaptatSize(100));
        make.height.mas_equalTo(AdaptatSize(130));
    }];
    [_likesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self).with.offset(-AdaptatSize(35));
        make.width.mas_equalTo(SCREEN_W / 3);
        make.height.mas_equalTo(AdaptatSize(65));
    }];
    [_starBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.likesBtn);
        make.centerX.equalTo(self);
        make.width.height.equalTo(self.likesBtn);
    }];
    [_historyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.bottom.equalTo(self.likesBtn);
        make.width.height.equalTo(self.likesBtn);
    }];
}

@end


@interface GJCustomNoButton ()
@property (nonatomic, strong) UIImageView *btnImg;
@property (nonatomic, strong) UILabel *btnLB;
@end

@implementation GJCustomNoButton

- (void)setTitle:(NSString *)title {
    _btnLB.text = title;
}

- (void)setImage:(NSString *)image {
    _btnImg.image = [UIImage imageNamed:image];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _btnImg = [[UIImageView alloc] init];
        _btnImg.userInteractionEnabled = NO;
        _btnImg.contentMode = UIViewContentModeScaleAspectFit;
        
        _btnLB = [[UILabel alloc] init];
        _btnLB.font = [APP_CONFIG appAdaptFontOfSize:12];
        _btnLB.textColor = APP_CONFIG.grayTextColor;
        
        [self addSubview:_btnImg];
        [self addSubview:_btnLB];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_btnImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.equalTo(self);
        if (self.image_edge) {
            make.width.height.mas_equalTo(self.image_edge);
        }
    }];
    [_btnLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

@end
