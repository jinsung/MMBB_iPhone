//
//  ChapterItem.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ChapterItem : NSObject {
	NSInteger id;
	NSString *title;
	NSString *subtitle;
	NSMutableArray *units;
}
@property (nonatomic) NSInteger id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSMutableArray *units;

@end
