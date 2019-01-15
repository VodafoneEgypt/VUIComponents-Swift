//
//  SimpleTextWithTitleView.h
//  AnaVodafoneUIRevamp
//
//  Created by Taha on 2/8/17.
//  Copyright © 2017 Karim Mousa. All rights reserved.
//

#import "BaseCardView.h"

IB_DESIGNABLE
@interface SimpleTextWithTitleCardView : BaseCardView

@property(nonatomic,strong) IBInspectable NSString *title;

@property(nonatomic,strong) IBInspectable NSString *desc;

@property(nonatomic) IBInspectable BOOL *withoutSeprator;

@end
