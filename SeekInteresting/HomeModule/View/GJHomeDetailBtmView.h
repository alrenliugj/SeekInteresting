//
//  GJHomeDetailBtmView.h
//  SeekInteresting
//
//  Created by Arlenly on 2020/1/25.
//  Copyright © 2020年 LiuGJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GJHomeDetailBtmView : UIView

@property (nonatomic, copy) void (^blockClickBtnIdx)(NSInteger idx);

@end

NS_ASSUME_NONNULL_END
