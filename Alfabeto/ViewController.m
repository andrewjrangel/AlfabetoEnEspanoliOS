//
//  ViewController.m
//  Alfabeto
//
//  Created by Ventura Rangel on 5/24/13.
//  Copyright (c) 2013 Antifragile Development. All rights reserved.
//

#import "ViewController.h"
#import "LettersViewController.h"
#import "ShapesViewController.h"
#import "ColorsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)lettersButtonPressed:(id)sender{
    LettersViewController *controller = [[LettersViewController alloc] initWithNibName:@"LettersViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalPresentationFullScreen;
    [self presentViewController:controller animated:(sender) ? YES : NO completion:nil];
}

- (IBAction)shapesButtonPressed:(id)sender{
    ShapesViewController *controller = [[ShapesViewController alloc] initWithNibName:@"ShapesViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalPresentationFullScreen;
    [self presentViewController:controller animated:(sender) ? YES : NO completion:nil];
}

- (IBAction)numbersButtonPressed:(id)sender{
    NumbersViewController *controller = [[NumbersViewController alloc] initWithNibName:@"NumbersViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalPresentationFullScreen;
    [self presentViewController:controller animated:(sender) ? YES : NO completion:nil];
}

- (IBAction)colorsButtonPRessed:(id)sender{
    ColorsViewController *controller = [[ColorsViewController alloc] initWithNibName:@"ColorsViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalPresentationFullScreen;
    [self presentViewController:controller animated:(sender) ? YES : NO completion:nil];
}


- (void)lettersViewControllerDidFinish:(LettersViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)shapesViewControllerDidFinish:(ShapesViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)numbersViewControllerDidFinish:(NumbersViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)colorsViewControllerDidFinish:(ColorsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
