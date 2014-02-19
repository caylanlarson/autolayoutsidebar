//
//  SemiAppDelegate.m
//  Sidebar Test
//
//  Created by Caylan Larson on 2/19/14.
//  Copyright (c) 2014 Semireg Industries. All rights reserved.
//

#import "SemiAppDelegate.h"

#import "ConstraintPack.h"
#import "NSView+Constraints.h"
#import "NSView+BackgroundColor.h"

@implementation SemiAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSView *contentView = self.window.contentView;
    contentView.SE_nametag = @"Content View";
    
    NSView *sidebarView = [[NSView alloc] init];
    sidebarView.SE_backgroundColor = [NSColor greenColor];
    [sidebarView SE_prepareForConstraintsWithNametag:@"Sidebar View"];
    [contentView addSubview:sidebarView];
    
    NSView *emptyView = [[NSView alloc] init];
    emptyView.SE_backgroundColor = [NSColor orangeColor];
    [emptyView SE_prepareForConstraintsWithNametag:@"Empty View"];
    [contentView addSubview:emptyView];
    
    StretchVerticallyToSuperview(sidebarView, 5, 1000);
    StretchVerticallyToSuperview(emptyView, 5, 1000);
    
    CONSTRAIN_WIDTH(sidebarView, 200);
    CONSTRAIN_MIN_WIDTH(emptyView, 200, 1000);
    
    CONSTRAIN_MIN_HEIGHT(sidebarView, 200, 1000);
    CONSTRAIN_MIN_HEIGHT(emptyView, 200, 1000);
    
    ALIGN_LEADING(sidebarView, 5);
//    LAYOUT_H(sidebarView, 10, emptyView);  // Does not work well because of center Y making this ambigous (two 1000 priority constraints).
    [CONSTRAINT_STACKING_H(sidebarView, emptyView, 10) SE_install];
    ALIGN_TRAILING(emptyView, 5);
    
//    NSLog(@"%@", [contentView viewLayoutDescription]);
//    NSLog(@"%@", [sidebarView viewLayoutDescription]);
//    NSLog(@"%@", [emptyView viewLayoutDescription]);
    
    [self.window visualizeConstraints:[contentView constraints]];
//    [contentView exerciseAmbiguityInLayout];
}

@end
