//
//  UIView+Constraints.m
//  130499
//
//  Created by Caylan Larson on 2/14/14.
//  Copyright (c) 2014 MMAcademy. All rights reserved.
//

#import "NSView+Constraints.h"
#import "ConstraintPack.h"

@implementation NSView (Constraints)

-(NSLayoutConstraint*)SE_constraintHeight:(NSNumber*)height
{
    return CONSTRAINT_SETTING_HEIGHT(self, height.floatValue);
}

-(NSLayoutConstraint*)SE_constraintAligningBottom:(NSNumber*)constant
{
    return CONSTRAINT_ALIGNING_BOTTOM(self, constant.floatValue);
}

-(void)SE_stretchHorizontallyToSuperviewWithIndent:(NSNumber*)indent priority:(NSNumber*)priority
{
    StretchHorizontallyToSuperview(self, indent.floatValue, priority.floatValue);
}

-(void)SE_prepareForConstraints
{
    [self SE_prepareForConstraintsWithNametag:nil];
}

-(void)SE_prepareForConstraintsWithNametag:(NSString *)nametag
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.SE_nametag = nametag ? nametag : nil;
}

@end
