//
//  AppDelegate.m
//  VeryReasonableTime
//
//  Created by Aaron Malone on 1/30/18.
//  Copyright © 2018 munge.net. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [self updateTitle];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTitle)
                                   userInfo:nil repeats:YES];
    [self setupMenu];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void) updateTitle {
    double secs = [[NSDate date] timeIntervalSince1970] + 3600;
    int beats = floor(fmod((secs / 86.4), 1000));
    [_statusItem setTitle:[NSString stringWithFormat:@"@%03i", beats]];
}

- (void)setupMenu {
    NSMenu *menu = [[NSMenu alloc] init];
    [menu addItemWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];
    _statusItem.menu = menu;
}

@end
