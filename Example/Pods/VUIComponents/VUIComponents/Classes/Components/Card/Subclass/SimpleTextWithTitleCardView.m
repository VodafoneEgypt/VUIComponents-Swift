//
//  SimpleTextWithTitleView.m
//  AnaVodafoneUIRevamp
//
//  Created by Taha on 2/8/17.
//  Copyright © 2017 Karim Mousa. All rights reserved.
//

#import "SimpleTextWithTitleCardView.h"
#import "BaseCardView+Protected.h"
#import "LanguageHandler.h"
#import "UIColor+Hex.h"

@interface SimpleTextWithTitleCardView()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIView *sepratorView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sepratorTopConstraint;

@end

@implementation SimpleTextWithTitleCardView

#pragma mark setters

-(void)setTitle:(NSString *)title{
    
    _title = title;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:0];
    
    NSDictionary* attributes;
    
    if([LanguageHandler sharedInstance].currentDirection ==RTL){
        
        [style setAlignment:NSTextAlignmentRight];
    }else{
        
        [style setAlignment:NSTextAlignmentLeft];
    }
    
    attributes = @{NSFontAttributeName:[UIFont fontWithName:[[LanguageHandler sharedInstance] stringForKey:@"regularFont"] size:20],
                   NSForegroundColorAttributeName:[UIColor colorWithCSS:@"333333"]};
    
    NSMutableAttributedString* attrStr1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",title] attributes:attributes];
    
    [attrStr1 addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0,attrStr1.length)];
    
    _titleLabel.attributedText = attrStr1;
    
    [self initialize];
}

-(void)setDesc:(NSString *)desc{
    
    _desc = desc;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:5];
    
    
    NSDictionary* attributes;
    
    if ([LanguageHandler sharedInstance].currentDirection == RTL) {
        
        [style setAlignment:NSTextAlignmentRight];
    }else{
        
        [style setAlignment:NSTextAlignmentLeft];
    }
    
    attributes = @{NSFontAttributeName:[UIFont fontWithName:[[LanguageHandler sharedInstance] stringForKey:@"regularFont"] size:16],
                   NSForegroundColorAttributeName:[UIColor colorWithCSS:@"333333"]};
    
    NSMutableAttributedString* attrStr1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",desc] attributes:attributes];
    
    [attrStr1 addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0,attrStr1.length)];
    
    _descLabel.attributedText = attrStr1;
    
    [self initialize];
}

-(void)setWithoutSeprator:(BOOL *)withoutSeprator{
    
    _withoutSeprator = withoutSeprator;
    
    if(withoutSeprator){
        _sepratorView.hidden = true;
        _sepratorTopConstraint.constant = 0;
    }else{
        
        _sepratorView.hidden = false;
        _sepratorTopConstraint.constant = 20;
    }
}
#pragma mark height adjustment

-(void)initializeContentView{
    
    contentViewHeight = 0;

    CGFloat width = self.frame.size.width-30;

    contentViewHeight += [_desc  isEqual: @""] ? 40 : 81;

    CGSize size = CGSizeMake(width, CGFLOAT_MAX);

    CGRect rect = [self.titleLabel.attributedText boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];

    contentViewHeight += rect.size.height;

    rect = [self.descLabel.attributedText boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];

    contentViewHeight += rect.size.height;
}

-(void)commonInit{
    
    [super commonInit];
    
    NSArray* views = [[NSBundle bundleForClass:[self class]]loadNibNamed:@"SimpleTextWithTitleCardView" owner:self options:nil];
    
    UIView* view = [views objectAtIndex:0];
    
    CGRect frame = view.frame;
    frame.size.width = self.bounds.size.width;
    view.frame = frame;
    self.bounds = view.frame;
    [self.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    
    [self addSubview:view];
    
}
@end
