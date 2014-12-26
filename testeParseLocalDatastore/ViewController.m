//
//  ViewController.m
//  testeParseLocalDatastore
//
//  Created by Henrique Morbin on 21/12/14.
//  Copyright (c) 2014 Morbix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTouched:(id)sender {
    
    PFObject *fooBar = [PFObject objectWithClassName:@"foobar"];
    
    [fooBar setObject:@"Henrique" forKey:@"nome"];
    [fooBar setObject:[NSDate date] forKey:@"data"];
    [fooBar saveEventually];
    [fooBar pinInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Pinned Ok");
        }else{
            NSLog(@"Add Error: %@", error.localizedDescription);
        }
    }];
}
- (IBAction)loadTouched:(id)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"foobar"];
    
    [query fromLocalDatastore];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Load Ok\n%@", objects);
        }else{
            NSLog(@"Load Error: %@", error.localizedDescription);
        }
    }];
}
@end
