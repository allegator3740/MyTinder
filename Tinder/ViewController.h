//
//  ViewController.h
//  Tinder
//
//  Created by  Oleg on 04.12.17.
//  Copyright © 2017  Oleg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *buttonLeft;
@property (strong, nonatomic) IBOutlet UIView *superView;

@property (strong, nonatomic) IBOutlet UIButton *buttonRight;

@property (strong, nonatomic) IBOutlet UIView *frontView;
@property (strong, nonatomic) IBOutlet UIImageView *frontImageView;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *myViewConstraint;
@property (strong, nonatomic) IBOutlet UIImageView *backImageView;

- (IBAction)leftButtonAction:(UIButton *)sender;
- (IBAction)rightButtonAction:(UIButton *)sender;

@end

