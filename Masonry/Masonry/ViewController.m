//
//  ViewController.m
//  Masonry
//
//  Created by 鳞潜羽翔 on 2019/9/14.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    //使用Masonry添加约束
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.and.height.equalTo(self.view).offset(20);
    //顶部边距
//        make.top.equalTo(self.view).offset(20);
//        //左边边距
//        make.left.equalTo(self.view).offset(20);
//        //底部边距
//        make.bottom.equalTo(self.view).offset(-20);
//
//        //右边边距
//        make.right.equalTo(self.view).offset(-20);
////        //让视图居中,位于屏幕中间
////        make.center.equalTo(self.view);
//    }];
    //第二种方法--函数式编程，链式编程
    
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.equalTo(self.view).offset(20);
//        make.right.bottom.equalTo(self.view).offset(-20);
//    }];
    //第三种方法
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        //设置视图的大小
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.center.equalTo(view);
    }];
    //第二种方法 --函数编程，链式编程
//    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.equalTo(self.view).offset(20);
//        make.right.bottom.equalTo(self.view).offset(-20);
//    }];
    
    
    UITextField *tf1 = [[UITextField alloc] init];
    tf1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:tf1];
    
    UITextField *tf2 = [[UITextField alloc] init];
    tf2.borderStyle = UITextBorderStyleRoundedRect;
    [view addSubview:tf2];
    
    [tf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(view).offset(40);
        make.right.equalTo(view).offset(-20);
    }];
    
    [tf2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(tf1);
        make.top.equalTo(tf1.mas_bottom).offset(20);
    }];
    
    //布局动画
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor orangeColor];
    [view addSubview:view3];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.top.equalTo(view2).offset(40);
        make.left.equalTo(view2).offset(40);
        make.top.equalTo(view2.mas_bottom).offset(40);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.layer.borderWidth = 2;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    self.viewdemon = view3;
    
    [btn addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"改变" forState:UIControlStateNormal];
    [view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(view3.mas_bottom).offset(20);
        make.left.equalTo(view2);
        make.top.equalTo(view3.mas_bottom).offset(20);
        make.size.mas_equalTo(view2);
    }];
    
    
}

-(void)startAnimation {
    //更改约束
    [self.viewdemon mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
       
    }];
    
    //增加动画效果
    [UIView animateWithDuration:2.0 animations:^{
        [self.view layoutIfNeeded];
    }];

}

@end
