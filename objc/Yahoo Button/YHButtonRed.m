//
//  YHButton.m
//  CustomButtonDemo
//
//  Created by aaron on 3/7/14.
//  Copyright (c) 2014 Pixel Egg. All rights reserved.
//

#import "YHButtonRed.h"
#import "YHButtonCellRed.h"

@implementation YHButtonRed

+ (Class)cellClass
{
	return [YHButtonCellRed class];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if (![aDecoder isKindOfClass:[NSKeyedUnarchiver class]])
		return [super initWithCoder:aDecoder];
    
	NSKeyedUnarchiver *unarchiver = (NSKeyedUnarchiver *)aDecoder;
    
	Class oldClass = [[self superclass] cellClass];
	Class newClass = [[self class] cellClass];
	
    
	[unarchiver setClass:newClass forClassName:NSStringFromClass(oldClass)];
	self = [super initWithCoder:aDecoder];
    
	[unarchiver setClass:oldClass forClassName:NSStringFromClass(oldClass)];
	
    /*= set title color to white =*/
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedTitle]];
    NSUInteger len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    [attrTitle addAttribute:NSForegroundColorAttributeName value:[NSColor whiteColor] range:range];
    [attrTitle fixAttributesInRange:range];
    [self setAttributedTitle:attrTitle];
    
	return self;
}
@end
