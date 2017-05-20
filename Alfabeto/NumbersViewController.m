//
//  NumbersViewController.m
//  Alfabeto
//
//  Created by Ventura Rangel on 6/7/13.
//  Copyright (c) 2013 Antifragile Development. All rights reserved.
//

#import "NumbersViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface NumbersViewController ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation NumbersViewController{
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
    x = 0;
    y = 0;
    firstRun = YES;
    
    [self numbersArrayMethod];
    [self englishWordsArrayMethod];
    [self spanishWordsArrayMethod];
    [self audioClipsArrayMethod];
    [self backgroundImageArrayMethod];
    
    UIImage *originalImage = [UIImage imageNamed:@"turtoise"];
    self.backgroundImageView.image = originalImage;
    self.numberLabel.text = @"1";
    self.spanishWordLabel.text = @"Uno";
    self.englishWordLabel.text = @"One";
    
    
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

- (void)numbersArrayMethod{
    self.numbersArray = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7",@"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"30", @"40", @"50", @"60", @"70", @"80", @"90", @"100", nil];
}

- (void)spanishWordsArrayMethod{
    self.spanishWordsArray = [NSArray arrayWithObjects:@"Uno", @"Dos", @"Tres", @"Cuatro", @"Cinco", @"Seis", @"Siete", @"Ocho", @"Nueve", @"Diez", @"Once", @"Doce", @"Trece", @"Catorce", @"Quince", @"Diecisése", @"Diecisiete", @"Dieciocho", @"Diecinueve", @"Viente", @"Trienta", @"Cuarenta", @"Cincuenta", @"Sesenta", @"Setenta", @"Ochenta", @"Noventa", @"Cien", nil];
}

- (void)englishWordsArrayMethod{
    self.englishWordsArray = [NSArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine", @"Ten", @"Eleven", @"Twelve", @"Thirteen", @"Fourteen", @"Fifteen", @"Sixteen", @"Seventeen", @"Eighteen", @"Nineteen", @"Twenty", @"Thirty", @"Fourty", @"Fifty", @"Sixty", @"Seventy", @"Eighty", @"Ninety", @"One Hundred", nil];
}

- (void)backgroundImageArrayMethod{
    self.backgroundImageArray = [NSArray arrayWithObjects:@"Amethyst", @"BelizeHole", @"Emerald", @"Pomegranate", @"Silver", @"Sunflower", @"turtoise", nil];
}

- (void)audioClipsArrayMethod{
    self.audioClipsArray = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eightteen", @"nineteen", @"twenty", @"thirty", @"fourty", @"fifty", @"sixty", @"seventy", @"eighty", @"ninty", @"hundred", nil];
}

-(void)screenSwippedLeft:(UIGestureRecognizer *)recognizer{
    firstRun = NO;
    
    if (x == 0) {
        self.numberString = [self.numbersArray objectAtIndex:1];
        x = x+1;
    } else if (x> self.numbersArray.count - 2){
        self.numberString = [self.numbersArray objectAtIndex:0];
        x = 0;
    } else if (x>=1 && x<=self.numbersArray.count - 2){
        x = x+1;
        self.numberString = [self.numbersArray objectAtIndex:x];
        
    }
    
    self.englishWordDictionary = [NSDictionary dictionaryWithObjects:self.englishWordsArray forKeys:self.numbersArray];
    self.spanishWordDictionary = [NSDictionary dictionaryWithObjects:self.spanishWordsArray forKeys:self.numbersArray];
    self.englishWordLabel.text = [NSString stringWithFormat:@"%@", [self.englishWordDictionary objectForKey:self.numberString]];
    self.spanishWordLabel.text = [NSString stringWithFormat:@"%@", [self.spanishWordDictionary objectForKey:self.numberString]];
    self.numberLabel.text = [NSString stringWithFormat:@"%@", self.numberString];
    
}
-(void)screenSwippedRight:(UIGestureRecognizer *)recognizer{
    firstRun = NO;
    
    if (x == 1) {
        x = x-1;
        self.numberString = [self.numbersArray objectAtIndex:0];
        
    } else if (x == 0){
        self.numberString = [self.numbersArray objectAtIndex:27];
        x = x-1;
        
    } else if (x>=2 && x<=self.numbersArray.count - 2){
        x = x-1;
        self.numberString = [self.numbersArray objectAtIndex:x];
        
    } else if (x <= 0){
        x = 27;
        x = x-1;
        self.numberString = [self.numbersArray objectAtIndex:26];
        
    }
    
    self.englishWordDictionary = [NSDictionary dictionaryWithObjects:self.englishWordsArray forKeys:self.numbersArray];
    self.spanishWordDictionary = [NSDictionary dictionaryWithObjects:self.spanishWordsArray forKeys:self.numbersArray];
    self.englishWordLabel.text = [NSString stringWithFormat:@"%@", [self.englishWordDictionary objectForKey:self.numberString]];
    self.spanishWordLabel.text = [NSString stringWithFormat:@"%@", [self.spanishWordDictionary objectForKey:self.numberString]];
    self.numberLabel.text = [NSString stringWithFormat:@"%@", self.numberString];
    
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
    [self.delegate numbersViewControllerDidFinish:self];
}

- (void)playSoundFile
{
    if (firstRun == YES) {
        self.fileString = [NSString stringWithFormat:@"one"];
    } else {
        self.audioClipDictionary = [NSDictionary dictionaryWithObjects:self.audioClipsArray forKeys:self.numbersArray];
        self.fileString = [NSString stringWithFormat:@"%@", [self.audioClipDictionary objectForKey:self.numberString]];
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
