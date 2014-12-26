//
//  ViewController.m
//  PanGesture
//
//  Created by Cyrilshanway on 2014/12/23.
//  Copyright (c) 2014年 Cyrilshanway. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *_redView;
    UIView *_blueView;
    int _points;
}
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    _blueView = [[UIView alloc] initWithFrame:CGRectMake(300, 100, 100, 100)];
    _blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_blueView];
    
    //gesture
    UIPanGestureRecognizer *redGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [_redView addGestureRecognizer:redGesture];
    
    UIPanGestureRecognizer *blueGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [_blueView addGestureRecognizer:blueGesture];
    
}

-(void)handlePanGesture:(UIPanGestureRecognizer *)gesture{
    NSLog(@"gesture");
    
    //這樣就可以拖拉動作了
    if (UIGestureRecognizerStateChanged == gesture.state) {
        //use translation offset
        CGPoint translation = [gesture translationInView:gesture.view];
        gesture.view.center = CGPointMake(gesture.view.center.x + translation.x,
                                          gesture.view.center.y + translation.y);
        
        //clear translation
        [gesture setTranslation:CGPointZero inView:gesture.view];
        
        //以上就可以拖拉
        //重新加
        _points += translation.x + translation.y;
        //累加
        _points += abs(translation.x + translation.y);
        self.pointsLabel.text = [@(_points) stringValue];
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
