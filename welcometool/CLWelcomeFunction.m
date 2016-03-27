//
//  CLWelcomeFunction.m
//  YYBlueTool
//
//  Created by MYO on 16/3/24.
//  Copyright © 2016年 MYO. All rights reserved.
//

#import "CLWelcomeFunction.h"
#import "define.h"
#import "UIButton+CLBlock.h"

@implementation WeclomeFormat



@end

@interface CLWelcomeFunction ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl *pageController;
@property (nonatomic, assign) NSInteger indexCount;
@property (nonatomic, assign) BOOL hidePage;

@end

@implementation CLWelcomeFunction
//+(instancetype)configTheWeclomeMessage:(NSArray *)imageArray andTheClickAction:(void (^)(UIButton *))clickBlock {
//    
//    return [[self alloc] initWithImageArray:imageArray andTheClickaction:clickBlock];
//    
//}

+(instancetype)configTheWeclomeMessage:(NSArray *)imageArray
                          andTheFormat:(WeclomeFormat *(^)())format
                     andTheClickAction:(void (^)(UIButton *))clickBlock {
    
    
    return [[self alloc] initWithImageArray:imageArray andTheFormat:format andTheClickaction:clickBlock];
    
}

-(instancetype)initWithImageArray:(NSArray *)imageArray
                     andTheFormat:(WeclomeFormat *(^)())format
                andTheClickaction:(void(^)(UIButton *button))clickButton  {
    
    if (self = [super init] ) {
        
         self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self configScorView:imageArray andTheFormat:format andTheCLick:clickButton];
        self.indexCount = imageArray.count;
        //[[UIApplication sharedApplication] setStatusBarHidden:YES];
        
    }
    
    
    return self;
    
}

-(void)configScorView:(NSArray *)imageArray
         andTheFormat:(WeclomeFormat *(^)())format
          andTheCLick:(void(^)(UIButton *button))clickBlock {
    
    WeclomeFormat *tempFormat = format();
    self.hidePage = tempFormat.hideThePage;
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.delegate = self;
    scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    scrollView.contentSize = CGSizeMake(kScreenWidth*imageArray.count, kScreenHeight);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    UIPageControl *pageController = [UIPageControl new];
    self.pageController = pageController;
    
    if (tempFormat.pageControllerFrame.size.width != 0) {
        
        pageController.frame = tempFormat.pageControllerFrame;
        
    } else {
        
        pageController.frame = CGRectMake(0, kScreenHeight - 60, kScreenWidth, 20);
        
    }
    
    if (tempFormat.pageIndexColor) {
        
        pageController.currentPageIndicatorTintColor = tempFormat.pageIndexColor;
        
    } else {
        
        pageController.currentPageIndicatorTintColor = [UIColor orangeColor];
    }
    
    pageController.numberOfPages = imageArray.count;
    
    for (int i = 0; i < imageArray.count; i++) {
        
        NSString *imageNameString = imageArray[i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNameString]];
        imageView.frame = CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight);
        [scrollView addSubview:imageView];
        
        if (i == imageArray.count - 1) {
            
            imageView.userInteractionEnabled = YES;
            UIButton *button = [UIButton buttonWithTile:tempFormat.buttonTitle?tempFormat.buttonTitle:@"点击进入" andType:UIControlStateNormal andImage:nil andTheClickBlock:clickBlock andTheEvent:UIControlEventTouchUpInside];
            if (tempFormat.buttonFrame.size.width != 0) {
                
                button.frame = tempFormat.buttonFrame;
                
            } else {
                
                
                button.frame = CGRectMake(0, kScreenHeight - 80, kScreenWidth, 20);
            }
            
            [imageView addSubview:button];
            
            if (tempFormat.buttonColor) {
                
                //button.backgroundColor = tempFormat.buttonColor;
                [button setTitleColor:tempFormat.buttonColor forState:UIControlStateNormal];
                
            } else {
                
                button.backgroundColor = [UIColor orangeColor];

                
            }
            
        }
        
    }
    
    [self addSubview:scrollView];
    [self addSubview:pageController];
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // scrollView.contentOffset.x
    CGFloat floatX = scrollView.contentOffset.x;
    self.pageController.currentPage = round(floatX/kScreenWidth);
    
    if (self.hidePage) {
        
        if (self.indexCount == self.pageController.currentPage + 1) {
            
            self.pageController.hidden = YES;
        } else {
            
            self.pageController.hidden = NO;
        }
        

    }
    
}
//-(instancetype)initWithImageArray:(NSArray *)imageArray andTheClickaction:(void(^)(UIButton *button))clickButton {
//    
//    if (self = [super init]) {
//        
//        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
//        [self configScorView:imageArray andTheCLick:clickButton];
//        
//        
//    }
//    
//    return  self;
//}
//
//-(void)configScorView:(NSArray *)imageArray andTheCLick:(void(^)(UIButton *button))clickBlock{
//    
//    UIScrollView *scrollView = [UIScrollView new];
//    scrollView.delegate = self;
//    scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
//    scrollView.contentSize = CGSizeMake(kScreenWidth*imageArray.count, kScreenHeight);
//    scrollView.showsVerticalScrollIndicator = NO;
//    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.pagingEnabled = YES;
//    UIPageControl *pageController = [UIPageControl new];
//    self.pageController = pageController;
//    pageController.frame = CGRectMake(0, kScreenHeight - 100, kScreenWidth, 30);
//    pageController.numberOfPages = imageArray.count;
//    pageController.currentPageIndicatorTintColor = [UIColor orangeColor];
//    for (int i = 0; i < imageArray.count; i++) {
//        
//        NSString *imageNameString = imageArray[i];
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNameString]];
//        imageView.frame = CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight);
//        [scrollView addSubview:imageView];
//        
//        if (i == imageArray.count - 1) {
//            
//            UIButton *button = [UIButton buttonWithTile:@"点击进入" andType:UIControlStateNormal andImage:nil andTheClickBlock:clickBlock andTheEvent:UIControlEventTouchUpInside];
//            button.frame = CGRectMake( 0, kScreenHeight - 100, kScreenWidth, 30);
//            [imageView addSubview:button];
//            button.backgroundColor = [UIColor grayColor];
//        }
//        
//    }
//    
//    [self addSubview:scrollView];
//    [self addSubview:pageController];
//    
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
