//
//  LettersViewController.h
//  Alfabeto
//
//  Created by Ventura Rangel on 5/24/13.
//  Copyright (c) 2013 Antifragile Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LettersViewController;

@protocol LettersViewControllerDelegate
- (void)lettersViewControllerDidFinish:(LettersViewController *)controller;
@end


@interface LettersViewController : UIViewController
@property (weak, nonatomic) id <LettersViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *letterLabel;
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UILabel *englishWordLabel;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) UISwipeGestureRecognizer *oneFingerSwipeLeft;
@property (strong, nonatomic) UISwipeGestureRecognizer *oneFingerSwipeRight;
@property (strong, nonatomic) UISwipeGestureRecognizer *twoFingerSwipeDown;
@property (strong, nonatomic) UISwipeGestureRecognizer *twoFingerSwipeRight;
@property (strong, nonatomic) UISwipeGestureRecognizer *twoFingerSwipeLeft;


@property (strong, nonatomic) NSArray *letterArray;
@property (strong, nonatomic) NSDictionary *myLetterDictionary;
@property (strong, nonatomic) NSDictionary *englishWordDictionary;
@property (strong, nonatomic) NSDictionary *audioClipDictionary;

@property (strong, nonatomic) NSArray *wordArray;
@property (strong, nonatomic) NSArray *englishWordArray;
@property (strong, nonatomic) NSArray *backgroundImageArray;
@property (strong, nonatomic) NSArray *audioClipArray;

@property (strong, nonatomic) NSString *letterString;
@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSString *fileString;
@property (strong, nonatomic) NSString *soundFilePath;


-(void)screenSwippedLeft:(UIGestureRecognizer *)recognizer;
-(void)screenSwippedRight:(UIGestureRecognizer *)recognizer;
-(void)screenSwippedDown:(UIGestureRecognizer *)recognizer;
-(void)twoFingerSwippedLeft:(UIGestureRecognizer *)recognizer;
-(void)twoFingerSwippedRight:(UIGestureRecognizer *)recognizer;

-(IBAction)letterPressed:(id)sender;

@end
