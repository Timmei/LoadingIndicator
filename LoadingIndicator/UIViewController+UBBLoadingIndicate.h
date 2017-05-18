//
//  UIViewController+UBBLoadingIndicate.h
//  Soy
//
//  Created by meichaoliang on 2017/5/18.
//  Copyright © 2017年 bai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ErrorTapBlock)(void);

@interface UIViewController (UBBLoadingIndicate)

@property (nonatomic, copy)ErrorTapBlock tapBlock;

- (void)ubbStartLoading;
- (void)ubbLoadingSuccess;
- (void)ubbLoadingError;

@end
