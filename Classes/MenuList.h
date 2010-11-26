//
//  MenuList.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MenuList : NSObject {
	NSMutableArray *items;
}

@property (nonatomic, retain) NSMutableArray* items;

@end
