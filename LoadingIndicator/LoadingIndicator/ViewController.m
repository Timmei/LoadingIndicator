//
//  ViewController.m
//  LoadingIndicator
//
//  Created by meichaoliang on 2017/5/18.
//  Copyright © 2017年 meichaoliang. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+UBBLoadingIndicate.h"

#define UBBWeakSelf __weak typeof(self) weakSelf = self;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak typeof(self) weakSelf = self;
    self.tapBlock = ^{
        NSLog(@"Reloading...");
        [weakSelf ubbLoadingSuccess];
    };
}

- (IBAction)loading:(id)sender {
    [self ubbStartLoading];
}
- (IBAction)loadSuccess:(id)sender {
    [self ubbLoadingSuccess];
}
- (IBAction)loadError:(id)sender {
    [self ubbLoadingError];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
