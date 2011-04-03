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
	NSInteger chapterID;
	NSInteger unitNum;
	NSString *title;
	NSInteger isBookmarked;
	NSInteger unitType; //main(0), special(1), more(2), bonus(3) mini(4)
    NSInteger questionGroupID;
}
@property (nonatomic) NSInteger id;
@property (nonatomic) NSInteger chapterID;
@property (nonatomic) NSInteger unitNum;
@property (nonatomic, retain) NSString *title;
@property (nonatomic) NSInteger isBookmarked;
@property (nonatomic) NSInteger unitType;
@property (nonatomic) NSInteger questionGroupID;
@end
