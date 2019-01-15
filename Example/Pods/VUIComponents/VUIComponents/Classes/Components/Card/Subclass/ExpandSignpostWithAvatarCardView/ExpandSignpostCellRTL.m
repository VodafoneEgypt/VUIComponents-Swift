//
//  ExpandSignpostCellRTL.m
//  AnaVodafoneUIRevamp
//
//  Created by Taha on 3/16/17.
//  Copyright © 2017 Karim Mousa. All rights reserved.
//

#import "ExpandSignpostCellRTL.h"

@interface ExpandSignpostCellRTL(){

    __weak IBOutlet UILabel *leftLabel;
    
    __weak IBOutlet UILabel *rightLabel;
    
    __weak IBOutlet UIImageView *imgView;
}

@end

@implementation ExpandSignpostCellRTL

#pragma mark setter
-(void)setModel:(ExpandSignpostCellModel *)model{
    
    if (model.leftText) {
        
        leftLabel.text = model.leftText;
    }
    if (model.leftTextColor) {
        
        leftLabel.textColor = model.leftTextColor;
    }
    if (model.rightTextColor) {
        
        rightLabel.textColor = model.rightTextColor;
    }
    if (model.rightText) {
        
        rightLabel.text = model.rightText;
    }
    
    if (model.image) {
        
        imgView.image = model.image;
    }
}

@end
