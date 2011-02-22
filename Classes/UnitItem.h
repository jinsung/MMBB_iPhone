//
//  UnitItem.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UnitItem : NSObject {
	NSInteger id;
	NSString *title;
	//NSString *subtitle;
	NSInteger isBookmarked;
}
@property (nonatomic) NSInteger id;
@property (nonatomic, retain) NSString *title;
//@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic) NSInteger isBookmarked;

@end
