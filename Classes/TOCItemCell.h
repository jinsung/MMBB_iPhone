//
//  TOCItemCell.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChapterItem.h"

@interface TOCItemCell : UITableViewCell {
	UILabel *titleLabel;
	UILabel *subTitleLabel;
}

- (void)setTitle:(NSString *) title;

@end
