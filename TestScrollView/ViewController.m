//
//  ViewController.m
//  TestScrollView
//
//  Created by liqian on 2018/10/27.
//  Copyright © 2018 liqian. All rights reserved.
//

#import "ViewController.h"
#import "InterScrollView.h"
#import "OuterScrollView.h"

@interface ViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate> {
    BOOL _interCanScroll;
    BOOL _outerCanScroll;
    CGFloat _interMaxmiumContentOffsety;
    BOOL _isCompletelyShrinked;
}
@property (weak, nonatomic) IBOutlet InterScrollView *internalSc;
@property (weak, nonatomic) IBOutlet OuterScrollView *outerSc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _internalSc.delegate = self;
    _internalSc.contentSize = CGSizeMake(1, 600);
    _internalSc.frame = CGRectMake(20, 50, 300, 500);
    
    _outerSc.delegate = self;
    _outerSc.contentSize = CGSizeMake(1, 1000);
    _outerSc.frame = CGRectMake(60, 120, 180, 480);
    
    _interMaxmiumContentOffsety = 100.0;
    _interCanScroll = YES;
    _outerCanScroll = NO;
    _isCompletelyShrinked = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (scrollView == _internalSc) {
        if (offsetY >= _interMaxmiumContentOffsety) {
            _interCanScroll = NO;
            _outerCanScroll = YES;
            scrollView.contentOffset = CGPointMake(0, _interMaxmiumContentOffsety);
            _isCompletelyShrinked = YES;
        }else {
            if (_interCanScroll) {
                scrollView.contentOffset = CGPointMake(0, offsetY);
            }else {
                scrollView.contentOffset = CGPointMake(0, _interMaxmiumContentOffsety);
            }
            _isCompletelyShrinked = NO;
        }
    }else if (scrollView == _outerSc) {
        if (_outerCanScroll) {
            if (offsetY <= 0) {
                _interCanScroll = YES;
                _outerCanScroll = NO;
                scrollView.contentOffset = CGPointZero;
            }else {

            }
        }else {
            scrollView.contentOffset = CGPointZero;
        }
    }
}


@end
