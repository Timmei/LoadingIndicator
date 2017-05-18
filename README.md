# LoadingIndicator
Simplicity of operator In ViewController LoadingIndicator

1.#import "UIViewController+UBBLoadingIndicate.h"
  #import <objc/runtime.h>
  提供网络加载过程中Loading
- (void)ubbStartLoading;
- (void)ubbLoadingSuccess;
- (void)ubbLoadingError;

2.加载失败，重新加载方法调用
    __weak typeof(self) weakSelf = self;
    self.tapBlock = ^{
        NSLog(@"Reloading...");
        [weakSelf ubbLoadingSuccess];
    };
    
3.实现原理（<objc/runtime.h>）
  运行时特性，给UIViewController添加加载视图，加载过程中
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
4.加载失败，点击重新加载动作（Block回调）
  typedef void(^ErrorTapBlock)(void);
  @property (nonatomic, copy)ErrorTapBlock tapBlock;
  调用实现：
  __weak typeof(self) weakSelf = self;
    self.tapBlock = ^{
        NSLog(@"Reloading...");
        [weakSelf ubbLoadingSuccess];
    };
