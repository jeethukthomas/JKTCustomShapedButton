//
//  ViewController.m
//  JKTCustomShapedButton
//
//  Created by Jeethu on 17/07/14.
//  Copyright (c) 2014 JKT. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
- (IBAction)Act:(id)sender;
- (IBAction)Act2:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)Act:(id)sender {
    NSLog(@"Clicked 1");
}

- (IBAction)Act2:(id)sender {
     NSLog(@"Clicked 2");
}
@end
