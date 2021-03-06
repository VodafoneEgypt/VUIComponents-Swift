//
//  BaseCardTableViewCell.h
//  AnaVodafoneUIRevamp
//
//  Created by Karim Mousa on 2/13/17.
//  Copyright © 2017 Karim Mousa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCardView.h"

@protocol CellHeightChangedDelegate <NSObject>

- (void) changeHeightTo:(CGFloat)height forCellAtIndexPath:(NSIndexPath*)indexPath;

@end

@interface BaseCardTableViewCell : UITableViewCell

@property (nonatomic,strong) NSIndexPath* indexPath;

@property (nonatomic,strong) BaseCardView* card;

@property (nonatomic, strong) id<CellHeightChangedDelegate> heightChangeDelegate;

@property (nonatomic) CGFloat width;

@end
