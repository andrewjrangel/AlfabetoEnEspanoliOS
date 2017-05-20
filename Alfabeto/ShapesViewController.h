//
//  ShapesViewController.h
//  Alfabeto
//
//  Created by Ventura Rangel on 6/6/13.
//  Copyright (c) 2013 Antifragile Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShapesViewController;

@protocol ShapesViewControllerDelegate
- (void)shapesViewControllerDidFinish:(ShapesViewController *)controller;
@end

@interface ShapesViewController : UIViewController
@property (weak, nonatomic) id <ShapesViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) UISwipeGestureRecognizer *twoFingerSwipeDown;
@property (strong, nonatomic) UISwipeGestureRecognizer *twoFingerSwipeLeft;
@property (strong, nonatomic) UISwipeGestureRecognizer *oneFingerSwipeLeft;
@property (strong, nonatomic) UISwipeGestureRecognizer *oneFingerSwipeRight;

@property (strong, nonatomic) IBOutlet UILabel *shapesLabel;
@property (strong, nonatomic) IBOutlet UILabel *spanishNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *englishNamesLabel;

@property (strong, nonatomic) NSMutableArray *shapesArray;
@property (strong, nonatomic) NSArray *spanishArray;
@property (strong, nonatomic) NSArray *englishArray;
@property (strong, nonatomic) NSArray *audioClipsArray;
@property (strong, nonatomic) NSArray *backgroundImageArray;

@property (strong, nonatomic) NSDictionary *spanishWordDictionary;
@property (strong, nonatomic) NSDictionary *englishWordDictionary;
@property (strong, nonatomic) NSDictionary *audioClipDictionary;


@property (strong, nonatomic) NSString *shapeString;
@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSString *soundFilePath;
@property (strong, nonatomic) NSString *fileString;



-(void)screenSwippedDown:(UIGestureRecognizer *)recognizer;
-(void)screenSwippedLeft:(UIGestureRecognizer *)recognizer;
-(void)screenSwippedRight:(UIGestureRecognizer *)recognizer;

-(IBAction)letterPressed:(id)sender;

@end
