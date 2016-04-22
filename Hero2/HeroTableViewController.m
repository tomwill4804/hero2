//
//  MasterViewController.m
//  HeroTracker
//
//  Created by Tom Williamson on 4/22/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "HeroTableViewController.h"
#import "HeroDetailsViewController.h"
#import "Hero.h"

@interface HeroTableViewController ()

@property NSMutableArray *objects;
@end

@implementation HeroTableViewController{
    
    NSMutableArray *heros;
}

- (void)viewDidLoad {
    
    self.title = @"S.H.I.E.L.D. Hero Tracker";
    
    [super viewDidLoad];
    [self loadHeroList];
    
    
}


- (void)loadHeroList
{
    
    heros = [[NSMutableArray alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Hero" ofType:@"json"];
    NSArray *newHeros = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary * hero in newHeros) {
        Hero *h = [Hero heroWithDictionary:hero];
        [heros addObject:h];
    }
    
    [self.tableView reloadData];
    
    
}


- (void)insertNewObject:(id)sender {
    
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"heroDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Hero *hero = heros[indexPath.row];
        HeroDetailsViewController *dvc = segue.destinationViewController;
        dvc.hero = hero;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return heros.count;
 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Hero *hero = heros[indexPath.row];
    cell.textLabel.text = hero.name;
    return cell;
}


@end
