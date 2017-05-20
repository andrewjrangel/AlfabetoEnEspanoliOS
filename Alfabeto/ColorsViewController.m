//
//  ColorsViewController.m
//  Alfabeto
//
//  Created by Ventura Rangel on 6/9/13.
//  Copyright (c) 2013 Antifragile Development. All rights reserved.
//

#import "ColorsViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ColorsViewController ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation ColorsViewController{
    int x;
    int y;
    BOOL firstRun;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    firstRun = YES;
    self.colorLabel.text = @"\u25A0";
    self.colorLabel.textColor = [UIColor redColor];
    self.colorLabel.font = [UIFont fontWithName:@"helvetica" size:200];
    
    self.backgroundLabel.text = @"\u25A0";
    self.backgroundLabel.textColor = [UIColor whiteColor];
    self.backgroundLabel.font = [UIFont fontWithName:@"helvetica" size:220];

    [self colorsArrayMethod];
    [self spanishWordArrayMethod];
    [self englishWordArrayMethod];
    [self audioClipsArrayMethod];
    [self backgroundImageArrayMethod];
    
    UIImage *originalImage = [UIImage imageNamed:@"turtoise"];
    self.backgroundImageView.image = originalImage;
    
    
    self.oneFingerSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(screenSwippedLeft:)];
    self.oneFingerSwipeLeft.numberOfTouchesRequired = 1;
    [self.oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    self.oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(screenSwippedRight:)];
    self.oneFingerSwipeRight.numberOfTouchesRequired = 1;
    [self.oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    self.twoFingerSwipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(screenSwippedDown:)];
    self.twoFingerSwipeDown.numberOfTouchesRequired = 2;
    [self.twoFingerSwipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    
    self.twoFingerSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerSwippedLeft:)];
    self.twoFingerSwipeLeft.numberOfTouchesRequired = 2;
    [self.twoFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [self.view addGestureRecognizer:self.twoFingerSwipeDown];
    [self.view addGestureRecognizer:self.twoFingerSwipeLeft];
    [self.view addGestureRecognizer:self.oneFingerSwipeRight];
    [self.view addGestureRecognizer:self.oneFingerSwipeLeft];
}


+ (SystemSoundID) createSoundID: (NSString*)name
{
    NSString *path = [NSString stringWithFormat: @"%@/%@",[[NSBundle mainBundle] resourcePath], name];
    
    NSURL* filePath = [NSURL fileURLWithPath: path isDirectory: NO];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)filePath, &soundID);
    return soundID;
}

-(void)colorsArrayMethod{
    self.colorsArray = [NSArray arrayWithObjects:[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], [UIColor purpleColor], [UIColor blackColor], [UIColor whiteColor], [UIColor brownColor], [UIColor grayColor], nil];
}

-(void)spanishWordArrayMethod{
    self.spanishWordsArray = [NSArray arrayWithObjects:@"Rojo", @"Naranja", @"Amarillo", @"Verde", @"Azul", @"Morado", @"Negro", @"Blanco", @"Marrón", @"Gris", nil];
}

-(void)englishWordArrayMethod{
    self.englishWordsArray = [NSArray arrayWithObjects:@"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Purple", @"Black", @"White", @"Brown", @"Gray", nil];
}

-(void)backgroundImageArrayMethod{
    self.backgroundImageArray = [NSArray arrayWithObjects:@"Amethyst", @"BelizeHole", @"Emerald", @"Pomegranate", @"Silver", @"Sunflower", @"turtoise", nil];
}

- (void)audioClipsArrayMethod{
    self.audioClipsArray = [NSArray arrayWithObjects:@"red", @"orange", @"yellow", @"green", @"blue", @"purple", @"black", @"white", @"brown2", @"grey", nil];
}

-(void)screenSwippedLeft:(UIGestureRecognizer *)recognizer{
    firstRun = NO;
    if (x == 0) {
        self.colorString = [self.colorsArray objectAtIndex:1];
        x = x+1;
    } else if (x> self.colorsArray.count - 2){
        self.colorString = [self.colorsArray objectAtIndex:0];
        x = 0;
    } else if (x>=1 && x<=self.colorsArray.count - 2){
        x = x+1;
        self.colorString = [self.colorsArray objectAtIndex:x];
        
    }
    
    self.englishWordDictionary = [NSDictionary dictionaryWithObjects:self.englishWordsArray forKeys:self.colorsArray];
    self.spanishWordDictionary = [NSDictionary dictionaryWithObjects:self.spanishWordsArray forKeys:self.colorsArray];
    self.englishWordLabel.text = [NSString stringWithFormat:@"%@", [self.englishWordDictionary objectForKey:self.colorString]];
    self.spanishWordLabel.text = [NSString stringWithFormat:@"%@", [self.spanishWordDictionary objectForKey:self.colorString]];
    self.colorLabel.text = [NSString stringWithFormat:@"%@", @"\u25A0"];
    self.colorLabel.font = [UIFont fontWithName:@"helvetica" size:200];
    self.colorLabel.textColor = self.colorString;
}

-(void)screenSwippedRight:(UIGestureRecognizer *)recognizer{
    firstRun = NO;
    if (x == 1) {
        x = x-1;
        self.colorString = [self.colorsArray objectAtIndex:0];
        
    } else if (x == 0){
        self.colorString = [self.colorsArray objectAtIndex:9];
        x = x-1;
        
    } else if (x>=2 && x<=self.colorsArray.count - 2){
        x = x-1;
        self.colorString = [self.colorsArray objectAtIndex:x];
        
    } else if (x <= 0){
        x = 9;
        x = x-1;
        self.colorString = [self.colorsArray objectAtIndex:8];
        
    }
    
    self.englishWordDictionary = [NSDictionary dictionaryWithObjects:self.englishWordsArray forKeys:self.colorsArray];
    self.spanishWordDictionary = [NSDictionary dictionaryWithObjects:self.spanishWordsArray forKeys:self.colorsArray];
    self.englishWordLabel.text = [NSString stringWithFormat:@"%@", [self.englishWordDictionary objectForKey:self.colorString]];
    self.spanishWordLabel.text = [NSString stringWithFormat:@"%@", [self.spanishWordDictionary objectForKey:self.colorString]];
    self.colorLabel.text = [NSString stringWithFormat:@"%@", @"\u25A0"];
    self.colorLabel.font = [UIFont fontWithName:@"helvetica" size:200];
    self.colorLabel.textColor = self.colorString;
    
}

-(void)twoFingerSwippedLeft:(UIGestureRecognizer *)recognizer{
    
    if (y == 0) {
        self.imageString = [self.backgroundImageArray objectAtIndex:1];
        y = y+1;
    } else if (y> self.backgroundImageArray.count - 2){
        self.imageString = [self.backgroundImageArray objectAtIndex:0];
        y = 0;
    } else if (y>=1 && y<=self.backgroundImageArray.count - 2){
        y = y+1;
        self.imageString = [self.backgroundImageArray objectAtIndex:y];
        
    }
    
    self.imageString = [self.backgroundImageArray objectAtIndex:y];
    
    UIImage *newImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.imageString]];
    self.backgroundImageView.image = newImage;
    
    
}

-(void)screenSwippedDown:(UIGestureRecognizer *)recognizer{
    [self.delegate colorsViewControllerDidFinish:self];
}

- (void)playSoundFile
{
    if (firstRun == YES) {
        self.fileString = [NSString stringWithFormat:@"red"];
    } else {
        self.audioClipDictionary = [NSDictionary dictionaryWithObjects:self.audioClipsArray forKeys:self.colorsArray];
        self.fileString = [NSString stringWithFormat:@"%@", [self.audioClipDictionary objectForKey:self.colorString]];
    }
    
    self.soundFilePath = [[NSBundle mainBundle] pathForResource:self.fileString ofType:@"m4a"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: self.soundFilePath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
}

-(IBAction)letterPressed:(id)sender{
    [self playSoundFile];
    [self.audioPlayer play];
}


@end
