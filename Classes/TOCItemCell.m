//
//  TOCItemCell.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TOCItemCell.h"

@implementation TOCItemCell


- (id)initWithStyle:(UITableViewCellStyle)style
	reuseIdentifier:(NSString *)reuseIdentifier{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		// Create a title view
		titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		
		// Put it on the content view of the cell
		[[self contentView] addSubview:titleLabel];
		
		// It is being retained by its superview
		[titleLabel release];
		
		// Same thing with the subtitle
		subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[[self contentView] addSubview:subTitleLabel];
		[subTitleLabel release];
    }
    return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	float inset = 5;
	CGRect bounds = [[self contentView] bounds];
	float h = bounds.size.height;
	float w = bounds.size.width;
	float valueWidth = 40;
	
	// Make a rectangle that is inset and square 
	CGRect innerFrame = CGRectMake(inset, inset, w, h - inset*2.0);
	[titleLabel setFrame:innerFrame];
	
	innerFrame.origin.x += innerFrame.size.width + inset;
	innerFrame.size.width = w - (h + valueWidth + inset * 4);
	[subTitleLabel setFrame:innerFrame];
}

- (void)setTitle:(NSString *) title
{
	[titleLabel setText: title];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
}

- (void)dealloc {
    [super dealloc];
}


@end
