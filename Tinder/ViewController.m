//
//  ViewController.m
//  Tinder
//
//  Created by  Oleg on 04.12.17.
//  Copyright © 2017  Oleg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray* picsArray;
    UIImage* tempBackImage;
}
@property(strong, nonatomic)UIImageView* likeImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    picsArray=[[NSArray alloc]initWithObjects:[UIImage imageNamed:@"501.jpg"], [UIImage imageNamed:@"502.jpg"], [UIImage imageNamed:@"503.jpg"], [UIImage imageNamed:@"504.jpg"], [UIImage imageNamed:@"505.jpg"], [UIImage imageNamed:@"506.jpg"], [UIImage imageNamed:@"507.jpg"], [UIImage imageNamed:@"508.jpg"], [UIImage imageNamed:@"509.jpg"], [UIImage imageNamed:@"510.jpg"], [UIImage imageNamed:@"511.jpg"], [UIImage imageNamed:@"512.jpg"], [UIImage imageNamed:@"513.jpg"], [UIImage imageNamed:@"514.jpg"], [UIImage imageNamed:@"515.jpg"], [UIImage imageNamed:@"516.jpg"], [UIImage imageNamed:@"517.jpg"], [UIImage imageNamed:@"518.jpg"], [UIImage imageNamed:@"519.jpg"], [UIImage imageNamed:@"520.jpg"], [UIImage imageNamed:@"555.png"], nil];
    
    [self distributingImages:self.backImageView];
    [self distributingImages:self.frontImageView];
    
    
    
    //UIImage* likeImage=[UIImage imageNamed:@"coolDislike.png"];
    //self.likeImage=[[UIImageView alloc]initWithImage:likeImage];
    //self.likeImage.frame=CGRectMake(200, 50, 203, 100);
    //[self.frontImageView addSubview:self.likeImage];
    
    
    //UIImage* img=[UIImage imageNamed:@"501.jpg"];
    //[self.frontImageView setImage:img];
    
    
    /*
    self.myViewConstraint.constant=-400;

    [UIView animateWithDuration:4.0 animations:^{
        [self.superView layoutIfNeeded];
    }];
    */
    
}


-(void)distributingImages:(UIImageView*)imageView{
    NSInteger index=arc4random()%21;
    UIImage* img=[picsArray objectAtIndex:index];
    [imageView setImage:img];
}

- (IBAction)leftButtonAction:(UIButton *)sender {
    UIImage* likeImage=[UIImage imageNamed:@"coolLike.png"];
    self.likeImage=[[UIImageView alloc]initWithImage:likeImage];
    self.likeImage.frame=CGRectMake(200, 50, 193, 100);
    [self.frontImageView addSubview:self.likeImage];
    [self imageMoving:-410];
    
}

- (IBAction)rightButtonAction:(UIButton *)sender {
    UIImage* likeImage=[UIImage imageNamed:@"coolDislike.png"];
    self.likeImage=[[UIImageView alloc]initWithImage:likeImage];
    self.likeImage.frame=CGRectMake(50, 50, 203, 100);
    [self.frontImageView addSubview:self.likeImage];
    [self imageMoving:410];
        NSLog(@"Yow");
}

-(void)imageMoving:(NSInteger)constant{
    self.view.userInteractionEnabled=NO;
    
    
    self.myViewConstraint.constant=constant;
    NSLog(@"left left");
    /*
     [UIView animateWithDuration:4.0 animations:^{
     [self.superView layoutIfNeeded];
     }];
     */
    [UIView animateWithDuration:0.5 animations:^{
        [self.superView layoutIfNeeded];
    } completion:^(BOOL finished) {
        UIImage* image=[self.backImageView image];
        [self.frontImageView setImage:image];
    }];
    
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //code to be executed on the main queue after delay
        self.myViewConstraint.constant=0;
        self.view.userInteractionEnabled=YES;
        [self.likeImage removeFromSuperview];
    });
    [self distributingImages:self.backImageView];
}

@end
