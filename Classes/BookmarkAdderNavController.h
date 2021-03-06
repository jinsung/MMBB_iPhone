//
//  SearchNavController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/21/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBBNavController.h"

@protocol ModelViewDelegate <NSObject>
@required
- (void) modelViewDone: (BOOL)success;
@end

@interface BookmarkAdderNavController : MMBBNavController {
	id <ModelViewDelegate> mvdelegate;
}

@property (retain) id mvdelegate;

@end
