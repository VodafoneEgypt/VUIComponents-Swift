//
//  BaseCardView.h
//  AnaVodafoneComponents
//
//  Created by Karim Mousa on 2/6/17.
//  Copyright © 2017 Karim Mousa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ HeightDidChangedBlock)(CGFloat height);

@interface BaseCardView : UIView{
    
    CGFloat contentViewHeight;
    
    __weak IBOutlet UIView *contentView;
}

@property (nonatomic, strong) HeightDidChangedBlock heightDidChangedBlock;

-(void)adjustCardView;
-(void)setContentViewHeight:(CGFloat)height;

@end
