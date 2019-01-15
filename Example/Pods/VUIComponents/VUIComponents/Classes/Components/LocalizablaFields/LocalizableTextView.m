//
//  CustomTextView.m
//  AnaVodafoneUIRevamp
//
//  Created by Karim Mousa on 6/13/17.
//  Copyright © 2017 Karim Mousa. All rights reserved.
//

#import "LocalizableTextView.h"
#import <Languagehandlerpod/LanguageHandler.h>

@implementation LocalizableTextView

-(void)setTxt:(NSString *)txt{

    self.text = [[LanguageHandler sharedInstance] stringForKey:txt];
}

@end
