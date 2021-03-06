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
        _value = [[NSMutableString alloc] initWithString:@"|||"];
        return self;
    }
    return nil;
}

- (void) animationStart{
    dispatch_queue_t animation = dispatch_queue_create("animation", DISPATCH_QUEUE_SERIAL);
    dispatch_async(animation, ^{
        for (int i = 0; i < 1000000000; i++) {
            self.value = [NSString stringWithFormat:@"%@. ", _value];
            usleep(100000);
        }
    });
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
    [train addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:NULL];
    [train animationStart];
    _trainView.text = train.value;
    NSLog(@"%@", train.value);
}

-(void) printHello{
    NSLog(@"hello from original!");
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"%@, %@", keyPath, change);
    dispatch_async(dispatch_get_main_queue(), ^{
        _trainView.text = train.value;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
