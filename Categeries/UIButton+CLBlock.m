//
//  UIButton+CLBlock.m
//  YYBlueTool
//
//  Created by MYO on 16/3/24.
//  Copyright © 2016年 MYO. All rights reserved.
//

#import "UIButton+CLBlock.h"
#import <objc/runtime.h>

const char *button;
@implementation UIButton (CLBlock)

+(instancetype)buttonWithTile:(NSString *)title
                      andType:(UIControlState)type
                     andImage:(UIImage *)image
             andTheClickBlock:(void (^)(UIButton *))clickBlock
                  andTheEvent:(UIControlEvents)event {
    
    
    return [[self alloc] initWithConfigTheButton:title andTyoe:type andImage:image andTheClickBlock:clickBlock andEvent:event];
    
    
}

-(instancetype)initWithConfigTheButton:(NSString *)title
                       andTyoe:(UIControlState)type
                      andImage:(UIImage *)image
              andTheClickBlock:(void(^)(UIButton *))clickBLlock
                      andEvent:(UIControlEvents)event {
    
    if (self = [super init]) {
        
        [self setBlockPropery:clickBLlock];
        if (title) {
            
            [self setTitle:title forState:type];
        }
        
        if (image) {
            
            [self setImage:image forState:type];
        }
        
        [self addTarget:self action:@selector(clickAction:) forControlEvents:event];
        
    }
    
    
    return self;
}

-(void)setBlockPropery:(void(^)(UIButton *button))buttonBlock {
    
    if (!objc_getAssociatedObject(self, button)) {
        
        objc_setAssociatedObject(self, button, buttonBlock, OBJC_ASSOCIATION_COPY);
    }
    
}
-(void(^)(UIButton *))getBlock {
    
    return objc_getAssociatedObject(self, button);
    
}

-(void)clickAction:(UIButton *)sender {
    
    
    void(^clickBlock)(UIButton *) =  [self getBlock];
     clickBlock(sender);
    
}


@end
