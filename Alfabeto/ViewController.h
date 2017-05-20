//
//  ViewController.h
//  Alfabeto
//
//  Created by Ventura Rangel on 5/24/13.
//  Copyright (c) 2013 Antifragile Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LettersViewController.h"
#import "ShapesViewController.h"
#import "NumbersViewController.h"
#import "ColorsViewController.h"

@interface ViewController : UIViewController <LettersViewControllerDelegate, ShapesViewControllerDelegate, NumbersViewControllerDelegate, ColorsViewControllerDelegate>
@property (strong, nonatomic) UISwipeGestureRecognizer *oneFingerSwipeRight;
//@property (weak, nonatomic) IBOutlet UIImageView *startImage;

- (IBAction)numbersButtonPressed:(id)sender;
- (IBAction)lettersButtonPressed:(id)sender;
- (IBAction)shapesButtonPressed:(id)sender;
- (IBAction)colorsButtonPRessed:(id)sender;

@end
