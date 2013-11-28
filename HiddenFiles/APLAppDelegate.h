//
//  APLAppDelegate.h
//  HiddenFiles
//
//  Created by 田單單 on 2013/11/28.
//  Copyright (c) 2013年 Danieltien. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface APLAppDelegate : NSObject <NSApplicationDelegate>

- (IBAction)unhideHiddenFolders:(id)sender;
@property (assign) IBOutlet NSButton *actionButton;
@property (assign) IBOutlet NSWindow *window;

@end
