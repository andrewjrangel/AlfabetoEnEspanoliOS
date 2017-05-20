//
//  ColorsViewController.h
//  Alfabeto
//
//  Created by Ventura Rangel on 6/9/13.
//  Copyright (c) 2013 Antifragile Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorsViewController;

@protocol ColorsViewControllerDelegate
- (void)colorsViewControllerDidFinish:(ColorsViewController *)controller;
@end

@interface ColorsViewController : UIViewController
@property (weak, nonatomic) id <ColorsViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) UISwipeGestureRecognizer *twoFingerSwipeDown;
@property (strong, nonatomic) UISwipeGestureRecognizer *twoFingerSwipeLeft;
@property (strong, nonatomic) UISwipeGestureRecognizer *oneFingerSwipeLeft;
@property (strong, nonatomic) UISwipeGestureRecognizer *oneFingerSwipeRight;

@property (strong, nonatomic) IBOutlet UILabel *colorLabel;
@property (strong, nonatomic) IBOutlet UILabel *englishWordLabel;
@property (strong, nonatomic) IBOutlet UILabel *spanishWordLabel;
@property (strong, nonatomic) IBOutlet UILabel *backgroundLabel;


@property (strong, nonatomic) NSDictionary *colorsDictionary;
@property (strong, nonatomic) NSDictionary *englishWordDictionary;
@property (strong, nonatomic) NSDictionary *spanishWordDictionary;
@property (strong, nonatomic) NSDictionary *audioClipDictionary;

@property (strong, nonatomic) NSArray *colorsArray;
@property (strong, nonatomic) NSArray *englishWordsArray;
@property (strong, nonatomic) NSArray *spanishWordsArray;
@property (strong, nonatomic) NSArray *backgroundImageArray;
@property (strong, nonatomic) NSArray *audioClipsArray;

@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSString *soundFilePath;
@property (strong, nonatomic) NSString *fileString;
@property (strong, nonatomic) UIColor *colorString;

-(void)screenSwippedDown:(UIGestureRecognizer *)recognizer;
-(void)screenSwippedLeft:(UIGestureRecognizer *)recognizer;
-(void)screenSwippedRight:(UIGestureRecognizer *)recognizer;

-(IBAction)letterPressed:(id)sender;

@end
