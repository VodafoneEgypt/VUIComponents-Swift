//
//  SimpleDropDownView.m
//  AnaVodafoneUIRevamp
//
//  Created by Taha on 3/1/17.
//  Copyright © 2017 Karim Mousa. All rights reserved.
//

#import "SimpleDropDownView.h"
#import "CustomDropDownStyleModel.h"
#import "LanguageHandler.h"
#import <VUIComponents/Utilities.h>

@class SimpleDropDownView;

@interface SimpleDropDownView()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation SimpleDropDownView

#pragma mark setters

-(void)setModel:(id)model{
    
    [super setModel:model];
    
    self.titleLabel.text = model;
}

-(void)setStyleFilePath:(NSString *)styleFilePath{
    
    [super setStyleFilePath:styleFilePath];
    
    // use rest of style parameters font and size
    
    CustomDropDownStyleModel *_objCustomDropDownStyleModel = [[CustomDropDownStyleModel alloc] initWithStyleFilePath:styleFilePath];
    
    self.titleLabel.font = [UIFont fontWithName:_objCustomDropDownStyleModel.fontFamily size:_objCustomDropDownStyleModel.fontSize];
}

#pragma mark initialize

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        [self commonInit];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if(self){
        
        [self commonInit];
    }
    
    return self;
}

-(void)commonInit{
    
    if ([LanguageHandler sharedInstance].currentDirection == RTL) {
        
        NSArray* views = [[Utilities getPodBundle]loadNibNamed:@"SimpleDropDownViewRTL" owner:self options:nil];
        
        UIView* view = [views objectAtIndex:0];
        
        view.frame = self.bounds;
        
        [self.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
        
        [self setModel:self.model];
        
        [self addSubview:view];
    }else{
        
        
        NSArray* views = [[Utilities getPodBundle]loadNibNamed:@"SimpleDropDownView" owner:self options:nil];
        
        UIView* view = [views objectAtIndex:0];
        
        view.frame = self.bounds;
        
        [self.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
        
        [self setModel:self.model];
        
        [self addSubview:view];
    }
}

@end
