//
//  ViewController.m
//  Test4Interview
//
//  Created by Junna Chuai on 10/14/14.
//  Copyright (c) 2014 Junna Chuai. All rights reserved.
//

#import "ViewController.h"

@interface Train()
@end
@implementation Train
@synthesize value = _value;
- (id) init{
    if(self = [super init]){
        _value = [[NSMutableString alloc] initWithString:@"."];
        return self;
    }
    return nil;
}

- (void) animationStart{
    for (int i = 0; i < 1000000000; i++) {
        [_value appendString:@" "];
        usleep(1000);
    }
}
@end

@interface ViewController ()

@end

@implementation ViewController
@synthesize trainView = _trainView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _trainView.textAlignment = NSTextAlignmentRight;
    train = [[Train alloc] init];
}

-(void) printHello{
    NSLog(@"hello from original!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
