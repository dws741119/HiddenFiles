//
//  APLAppDelegate.m
//  HiddenFiles
//
//  Created by 田單單 on 2013/11/28.
//  Copyright (c) 2013年 Danieltien. All rights reserved.
//

#import "APLAppDelegate.h"

@implementation APLAppDelegate {
	BOOL isAppleShowAllFiles;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSTask *task = [[NSTask alloc] init];

	[task setLaunchPath:@"/usr/bin/defaults" ];

	NSArray *arguments;
	arguments = [ NSArray arrayWithObjects : @"read" , @"com.apple.finder" , @"AppleShowAllFiles" , nil ];
	[task setArguments : arguments];

	NSPipe *pipe = [NSPipe pipe];
	[task setStandardOutput : pipe];

	NSFileHandle *file = [pipe fileHandleForReading ];

	[task launch ];

	NSData *data = [file readDataToEndOfFile ];

	NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

	isAppleShowAllFiles = [string boolValue];
	self.actionButton.title = isAppleShowAllFiles ? @"Hidden" : @"Show";
}

- (IBAction)unhideHiddenFolders:(id)sender
{
	if (isAppleShowAllFiles) {
		system("defaults write com.apple.finder AppleShowAllFiles NO; killall Finder");
	}
	else {
		system("defaults write com.apple.finder AppleShowAllFiles YES; killall Finder");
	}

	isAppleShowAllFiles = !isAppleShowAllFiles;
	self.actionButton.title = isAppleShowAllFiles ? @"Hidden" : @"Show";
}

@end
