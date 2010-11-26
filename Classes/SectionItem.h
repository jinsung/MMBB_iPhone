//
//  SectionItem.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SectionItem : NSObject {
	NSString *title;
	NSMutableArray *chapters;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSMutableArray *chapters;

@end
