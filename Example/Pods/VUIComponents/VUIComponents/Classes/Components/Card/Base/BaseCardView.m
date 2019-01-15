//
//  BaseCardView.m
//  AnaVodafoneComponents
//
//  Created by Karim Mousa on 2/6/17.
//  Copyright © 2017 Karim Mousa. All rights reserved.
//

#import "BaseCardView.h"
#import "BaseCardView+Protected.h"

@interface BaseCardView()

@end

@implementation BaseCardView

-(instancetype)initWithFrame:(CGRect)frame{
    
    NSLog(@"initWithFrame");
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    
    NSLog(@"initWithCoder");

    self = [super initWithCoder:coder];
    
    if (self) {
        
        [self commonInit];
    }
    
    return self;
}

-(void)adjustCardView{
    
    [self initialize];
}


-(void)setContentViewHeight:(CGFloat)height {
    contentViewHeight = height;
}

@end
