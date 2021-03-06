//
//  NSMenuTableView.m
//  jj
//
//  Created by LY_MD on 2020/7/23.
//  Copyright © 2020 LY_MD. All rights reserved.
//

#import "NSMenuTableView.h"

@implementation NSMenuTableView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

/// 设置右键菜单
/// @param event <#event description#>
- (NSMenu *)menuForEvent:(NSEvent *)event{
    
    if (event.type == NSEventTypeRightMouseDown) {
        NSPoint menuPoint = [self convertPoint:[event locationInWindow] fromView:nil];
        NSInteger row = [self rowAtPoint:menuPoint];
         if (row >= 0) {
           NSMenu * menu = [[NSMenu alloc]initWithTitle:@"Menu"];
           NSMenuItem * item1 = [[NSMenuItem alloc]initWithTitle:@"删除" action:@selector(menuDelete:) keyEquivalent:@""];
           NSMenuItem * item2 = [[NSMenuItem alloc]initWithTitle:@"查看详情>" action:@selector(menuDetail:) keyEquivalent:@""];
           item1.tag = row;
           item2.tag = row;
           item1.target = self;
           item2.target = self;
           [menu addItem:item1];
           [menu addItem:item2];

           return menu;
        }

    }
    
    return nil;
    
}
- (void)menuDelete:(NSMenuItem *)item {
    
    if ([self.mhdelegate respondsToSelector:@selector(tableView:didClickMenuDelete:)]) {
        [self.mhdelegate tableView:self didClickMenuDelete:item.tag];
    }
    
}
- (void)menuDetail:(NSMenuItem *)item {
    
    if ([self.mhdelegate respondsToSelector:@selector(tableView:didClickMenuDetail:)]) {
        [self.mhdelegate tableView:self didClickMenuDetail:item.tag];
    }
    
}
@end
