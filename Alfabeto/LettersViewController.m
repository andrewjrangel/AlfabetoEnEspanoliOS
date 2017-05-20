//
//  LettersViewController.m
//  Alfabeto
//
//  Created by Ventura Rangel on 5/24/13.
//  Copyright (c) 2013 Antifragile Development. All rights reserved.
//

#import "LettersViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface LettersViewController ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation LettersViewController{
    int x;
    int y;
    BOOL firstRun;
}

+ (SystemSoundID) createSoundID: (NSString*)name
{
    NSString *path = [NSString stringWithFormat: @"%@/%@",[[NSBundle mainBundle] resourcePath], name];
    
    NSURL* filePath = [NSURL fileURLWithPath: path isDirectory: NO];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)filePath, &soundID);
    return soundID;
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
    UIImage *originalImage = [UIImage imageNamed:@"turtoise"];
    self.backgroundImageView.image = originalImage;
    firstRun = YES;
    x = 0;
    y = 0;
    [self myLetterArray];
    [self myWordArray];
    [self myEnglishWordArray];
    [self englishWordDictionary];
    [self myLetterDictionary];
    [self backgroundImageArrayMethod];
    [self audioClipArrayMethod];
    
    
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
    
    self.twoFingerSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerSwippedRight:)];
    self.twoFingerSwipeRight.numberOfTouchesRequired = 2;
    [self.twoFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    
    [self.view addGestureRecognizer:self.oneFingerSwipeLeft];
    [self.view addGestureRecognizer:self.oneFingerSwipeRight];
    [self.view addGestureRecognizer:self.twoFingerSwipeDown];
    [self.view addGestureRecognizer:self.twoFingerSwipeLeft];
    [self.view addGestureRecognizer:self.twoFingerSwipeRight];
}

-(void)myLetterArray{
    self.letterArray = [NSArray arrayWithObjects:@"A", @"B", @"C", @"Ch", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"Ll", @"M", @"N", @"Ñ", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    
}

-(void)myWordArray{
    self.wordArray = [NSArray arrayWithObjects:@"Agua", @"Bolsa", @"Cebra", @"Chocolate", @"Deportes", @"Elafonte", @"Flor", @"Gato", @"Helado", @"Isla", @"Juego", @"Koala", @"León", @"Llave", @"Manzana", @"Noche", @"Ñame", @"Ojo", @"Perro", @"Queso", @"Ratón", @"Sol", @"Tiempo", @"Uva", @"Vestido", @"Wok", @"Xilofono", @"Yac", @"Zapatos", nil];
}

-(void)myEnglishWordArray{
    self.englishWordArray = [NSArray arrayWithObjects:@"Water", @"Purse", @"Zebra", @"Chocolate", @"Sports", @"Elaphant", @"Flower", @"Cat", @"Ice Cream", @"Island", @"Game", @"Koala", @"Lion", @"Key", @"Apple", @"Night", @"Yam", @"Eye", @"Dog", @"Cheese", @"Mouse", @"Sun", @"Weather", @"Grape", @"Dress", @"Wok", @"Xilophone", @"Yak", @"Shoes", nil];
}

- (void)backgroundImageArrayMethod{
    self.backgroundImageArray = [NSArray arrayWithObjects:@"Amethyst", @"BelizeHole", @"Emerald", @"Pomegranate", @"Silver", @"Sunflower", @"turtoise", nil];
}

-(void)audioClipArrayMethod{
    self.audioClipArray = [NSArray arrayWithObjects: @"Aclip", @"Bclip", @"Cclip", @"Chclip", @"Dclip", @"Eclip", @"Fclip", @"Gclip", @"Hclip", @"Iclip", @"Jclip", @"Kclip", @"Lclip", @"Llclip", @"Mclip", @"Nclip", @"Enyeclip", @"Oclip", @"Pclip", @"Qclip", @"Rclip", @"Sclip", @"Tclip", @"Uclip", @"Vclip", @"Wclip", @"Xclip", @"Yclip", @"Zclip", nil];
}

-(void)screenSwippedLeft:(UIGestureRecognizer *)recognizer{
    firstRun = NO;
    if (x == 0) {
        self.letterString = [self.letterArray objectAtIndex:1];
        x = x+1;
    } else if (x> self.letterArray.count - 2){
        self.letterString = [self.letterArray objectAtIndex:0];
        x = 0;
    } else if (x>=1 && x<=self.letterArray.count - 2){
        x = x+1;
        self.letterString = [self.letterArray objectAtIndex:x];
        
    }
    
    
    
//    int myIndex = arc4random_uniform(self.letterArray.count);
//    self.letterString = [self.letterArray objectAtIndex:myIndex];
    
    self.letterLabel.text = [NSString stringWithFormat:@"%@", self.letterString];

    self.myLetterDictionary = [NSDictionary dictionaryWithObjects:self.wordArray forKeys:self.letterArray];
    self.englishWordDictionary = [NSDictionary dictionaryWithObjects:self.englishWordArray forKeys:self.letterArray];
    
    self.wordLabel.text = [NSString stringWithFormat:@"%@", [self.myLetterDictionary objectForKey:self.letterString]];
    self.englishWordLabel.text = [NSString stringWithFormat:@"%@", [self.englishWordDictionary objectForKey:self.letterString]];

   

}

-(void)screenSwippedRight:(UIGestureRecognizer *)recognizer{
    firstRun = NO;
    if (x == 1) {
         x = x-1;
        self.letterString = [self.letterArray objectAtIndex:0];
        
    } else if (x == 0){
        self.letterString = [self.letterArray objectAtIndex:28];
        x = x-1;
    
    } else if (x>=2 && x<=self.letterArray.count - 2){
        x = x-1;
        self.letterString = [self.letterArray objectAtIndex:x];
        
    } else if (x <= 0){
        x = 28;
        x = x-1;
        self.letterString = [self.letterArray objectAtIndex:27];
        
    }
    
    
    //    int myIndex = arc4random_uniform(self.letterArray.count);
    //    self.letterString = [self.letterArray objectAtIndex:myIndex];
    
    self.letterLabel.text = [NSString stringWithFormat:@"%@", self.letterString];
    
    self.myLetterDictionary = [NSDictionary dictionaryWithObjects:self.wordArray forKeys:self.letterArray];
    self.englishWordDictionary = [NSDictionary dictionaryWithObjects:self.englishWordArray forKeys:self.letterArray];
    
    self.wordLabel.text = [NSString stringWithFormat:@"%@", [self.myLetterDictionary objectForKey:self.letterString]];
    self.englishWordLabel.text = [NSString stringWithFormat:@"%@", [self.englishWordDictionary objectForKey:self.letterString]];
    
    
}

-(void)screenSwippedDown:(UIGestureRecognizer *)recognizer{
    [self.delegate lettersViewControllerDidFinish:self];
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

-(void)twoFingerSwippedRight:(UIGestureRecognizer *)recognizer{
    
}

- (void)playSoundFile
{
    if (firstRun == YES) {
        self.fileString = [NSString stringWithFormat:@"Aclip"];
    } else {
    self.audioClipDictionary = [NSDictionary dictionaryWithObjects:self.audioClipArray forKeys:self.letterArray];
    self.fileString = [NSString stringWithFormat:@"%@", [self.audioClipDictionary objectForKey:self.letterString]];
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
