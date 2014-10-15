//
//  ViewController.h
//  Test4Interview
//
//  Created by Junna Chuai on 10/14/14.
//  Copyright (c) 2014 Junna Chuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Train : NSObject
@property (nonatomic, readonly) NSMutableString* value;
@end

@interface ViewController : UIViewController{
    Train* train;
}
@property (weak, nonatomic) IBOutlet UITextView *trainView;

@end

