//
//  InterScrollView.m
//  TestScrollView
//
//  Created by liqian on 2018/10/27.
//  Copyright © 2018 liqian. All rights reserved.
//

#import "InterScrollView.h"

@implementation InterScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
