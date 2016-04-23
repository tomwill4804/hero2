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

//
//  build an array of Heros
//
- (void)loadHeroList
{
    
    heros = [[NSMutableArray alloc] init];
    //
    //  get json data
    //
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Hero" ofType:@"json"];
    NSArray *newHeros = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    //
    //  loop through each hero
    //
    for (NSDictionary * hero in newHeros) {
        Hero *h = [Hero heroWithDictionary:hero];
        [heros addObject:h];
    }
    
    //
    //  sort the list
    //
    NSSortDescriptor *asc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [heros sortUsingDescriptors:[NSArray arrayWithObject:asc]];

    
    [self.tableView reloadData];
    
    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"heroDetails"]) {
        NSIndexPath *indexPath = (self.tableView).indexPathForSelectedRow;
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


@end
