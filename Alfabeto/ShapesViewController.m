//
//  ShapesViewController.m
//  Alfabeto
//
//  Created by Ventura Rangel on 6/6/13.
//  Copyright (c) 2013 Antifragile Development. All rights reserved.
//

#import "ShapesViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ShapesViewController ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation ShapesViewController{
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
    y = 0;
    x = 0;
    firstRun = YES;
    UIImage *originalImage = [UIImage imageNamed:@"turtoise"];
    self.backgroundImageView.image = originalImage;
    self.shapesLabel.text = @"\u25CF";
    
    [self shapesArrayMethod];
    [self spanishNamesMethod];
    [self englishNamesMethod];
    [self audioClipsArrayMethod];
    [self backgroundImageArrayMethod];
    [self spanishWordDictionary];
    [self englishWordDictionary];
    
    
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

-(void)shapesArrayMethod{
    self.shapesArray = [NSMutableArray arrayWithObjects:@"\u25CF", @"\u2605", @"\u25A0", @"\u25B2", @"\u25C6", @"\u25AC", nil];
}

-(void)spanishNamesMethod{
    self.spanishArray = [NSArray arrayWithObjects:@"Círculo", @"Estrella", @"Cuadrada", @"Triángulo", @"Rombo", @"Rectángulo", nil];
}

-(void)englishNamesMethod{
    self.englishArray = [NSArray arrayWithObjects:@"Circle", @"Star", @"Square", @"Triangle", @"Diamond", @"Rectangle", nil];
}

- (void)audioClipsArrayMethod{
    self.audioClipsArray = [NSArray arrayWithObjects:@"circle", @"star", @"square", @"triangle", @"diamond", @"rectangle", nil];
}

- (void)backgroundImageArrayMethod{
    self.backgroundImageArray = [NSArray arrayWithObjects:@"Amethyst", @"BelizeHole", @"Emerald", @"Pomegranate", @"Silver", @"Sunflower", @"turtoise", nil];
}

-(void)screenSwippedLeft:(UIGestureRecognizer *)recognizer{
    firstRun = NO;

    if (x == 0) {
        self.shapeString = [self.shapesArray objectAtIndex:1];
        x = x+1;
    } else if (x> self.shapesArray.count - 2){
        self.shapeString = [self.shapesArray objectAtIndex:0];
        x = 0;
    } else if (x>=1 && x<=self.shapesArray.count - 2){
        x = x+1;
        self.shapeString = [self.shapesArray objectAtIndex:x];
        
    }
    
    
    self.englishWordDictionary = [NSDictionary dictionaryWithObjects:self.englishArray forKeys:self.shapesArray];
    self.spanishWordDictionary = [NSDictionary dictionaryWithObjects:self.spanishArray forKeys:self.shapesArray];
    
    self.englishNamesLabel.text = [NSString stringWithFormat:@"%@", [self.englishWordDictionary objectForKey:self.shapeString]];
    self.spanishNameLabel.text = [NSString stringWithFormat:@"%@", [self.spanishWordDictionary objectForKey:self.shapeString]];
    self.shapesLabel.text = [NSString stringWithFormat:@"%@", self.shapeString];
}
-(void)screenSwippedRight:(UIGestureRecognizer *)recognizer{
    firstRun = NO;

    if (x == 1) {
        x = x-1;
        self.shapeString = [self.shapesArray objectAtIndex:0];
        
    } else if (x == 0){
        self.shapeString = [self.shapesArray objectAtIndex:5];
        x = x-1;
        
    } else if (x>=2 && x<=self.shapesArray.count - 2){
        x = x-1;
        self.shapeString = [self.shapesArray objectAtIndex:x];
        
    } else if (x <= 0){
        x = 5;
        x = x-1;
        self.shapeString = [self.shapesArray objectAtIndex:4];
        
    }
    
    
    self.englishWordDictionary = [NSDictionary dictionaryWithObjects:self.englishArray forKeys:self.shapesArray];
    self.spanishWordDictionary = [NSDictionary dictionaryWithObjects:self.spanishArray forKeys:self.shapesArray];
    
    self.englishNamesLabel.text = [NSString stringWithFormat:@"%@", [self.englishWordDictionary objectForKey:self.shapeString]];
    self.spanishNameLabel.text = [NSString stringWithFormat:@"%@", [self.spanishWordDictionary objectForKey:self.shapeString]];
    self.shapesLabel.text = [NSString stringWithFormat:@"%@", self.shapeString];
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
    [self.delegate shapesViewControllerDidFinish:self];
}

- (void)playSoundFile
{
    if (firstRun == YES) {
        self.fileString = [NSString stringWithFormat:@"circle"];
    } else {
        self.audioClipDictionary = [NSDictionary dictionaryWithObjects:self.audioClipsArray forKeys:self.shapesArray];
        self.fileString = [NSString stringWithFormat:@"%@", [self.audioClipDictionary objectForKey:self.shapeString]];
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
