//
//  SignpostsWithAvatarCardView.h
//  AnaVodafoneUIRevamp
//
//  Created by Taha on 2/12/17.
//  Copyright © 2017 Karim Mousa. All rights reserved.
//

#import "ExpandableBaseCardView.h"
#import <VUIComponents/AnaVodafoneLabel.h>

typedef void(^TargetBlock)(void);

@interface SignpostsWithAvatarCardView : ExpandableBaseCardView{
    
    __weak IBOutlet NSLayoutConstraint *verticalLineViewWidthConstraint;
    
    __weak IBOutlet UIView *verticalLineView;
    
    __weak IBOutlet UIImageView *arrowImgView;
    
    __weak IBOutlet AnaVodafoneLabel *subTitleLabel;
    
    __weak IBOutlet AnaVodafoneLabel *titleLabel;
    
    __weak IBOutlet NSLayoutConstraint *titleLabelTopConstraint;
    
    __weak IBOutlet UIButton *viewButton;
}

@property (strong, nonatomic) UIColor *avatarImgViewBGColor;

@property (nonatomic, strong) NSArray* buttons;

@property (nonatomic) IBInspectable BOOL verticalLine;

@property (nonatomic,strong) IBInspectable UIColor* verticalLinColor;

@property (nonatomic,strong) NSString* title;

@property (nonatomic)IBInspectable float titleFontSize;

@property (nonatomic,strong) NSString* subTitle;

@property (nonatomic) IBInspectable float subTitleFontSize;

@property (strong ,nonatomic) TargetBlock targetBlock;

@property(nonatomic,strong) NSString* secondTitle;

@property(nonatomic,strong) IBInspectable UIImage* avatarImage;

@property (nonatomic) IBInspectable BOOL withoutAvatarImage;

@property (nonatomic ,strong) NSArray *expandTableArray;

@property (nonatomic) int tableViewSelectedIndexRow;

@property(nonatomic) BOOL withRadioButtons;

@property (nonatomic) BOOL expandable;

@property (nonatomic) IBInspectable BOOL withoutCircleImage;

-(void)setSubTitleLabelAdjustsFontSizeToFitWidth:(Boolean)F andNumberOfLine:(NSInteger)N;
-(UIImageView *)getAvatarImageView;
-(void)setAvatarImageView:(UIImageView *)imageView;

@end
