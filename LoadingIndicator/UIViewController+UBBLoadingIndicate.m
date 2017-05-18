//
//  UIViewController+UBBLoadingIndicate.m
//  Soy
//
//  Created by meichaoliang on 2017/5/18.
//  Copyright © 2017年 bai. All rights reserved.
//

#import "UIViewController+UBBLoadingIndicate.h"
#import <objc/runtime.h>

@implementation UIViewController (UBBLoadingIndicate)

static char backviewKey;
static char loadImageKey;
static char tapBlockKey;


- (UIView *)backview{
    return objc_getAssociatedObject(self, &backviewKey);
}

- (void)setBackview:(UIView *)view{
    objc_setAssociatedObject(self, &backviewKey, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImageView *)loadingImageView{
    return objc_getAssociatedObject(self, &loadImageKey);
}

- (void)setLoadingImageView:(UIImageView *)imageView{
    objc_setAssociatedObject(self, &loadImageKey, imageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ErrorTapBlock)tapBlock{
    return objc_getAssociatedObject(self, &tapBlockKey);
}

- (void)setTapBlock:(ErrorTapBlock)tapBlock{
    objc_setAssociatedObject(self, &tapBlockKey, tapBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ubbStartLoading{
    
    if (!self.backview) {
        self.backview = [[UIView alloc]initWithFrame:self.view.bounds];
        self.backview.backgroundColor = [UIColor whiteColor];
        UIImage *image = [UIImage imageNamed:@"loading"];
        self.loadingImageView = [[UIImageView alloc]initWithImage:image];
        self.loadingImageView.center = self.view.center;
        [self.backview addSubview:self.loadingImageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loaddingTap:)];
        [self.backview addGestureRecognizer:tap];
        
    }
    [self.loadingImageView setImage:[UIImage imageNamed:@"loading"]];
    [self.view addSubview:self.backview];
}
- (void)ubbLoadingSuccess{
//    [self.loadingImageView setImage:[UIImage imageNamed:@"loading_success"]];
    [self.backview performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.3];
//    [self.backview removeFromSuperview];
}
- (void)ubbLoadingError{
    [self.loadingImageView setImage:[UIImage imageNamed:@"loading_error"]];
    [self.backview performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.6];
}

- (void)loaddingTap:(id)sender{
    if (self.tapBlock) {
        self.tapBlock();
    }
}

@end
