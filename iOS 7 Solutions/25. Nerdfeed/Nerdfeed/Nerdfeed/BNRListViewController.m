//
//  BNRListViewController.m
//  Nerdfeed
//
//  Created by Joe Conway on 2/25/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRListViewController.h"
#import "BNRRSSFeed.h"
#import "BNRRSSItem.h"
#import "BNRWebViewController.h"

@interface BNRListViewController () <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *jsonData;
@property (nonatomic, strong) BNRRSSFeed *feed;

@end

@implementation BNRListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self) {
        self.navigationItem.title = @"Top 10 Songs";
        [self fetchFeed];
    }
    return self;
}

- (void)fetchFeed
{
    self.jsonData = [[NSMutableData alloc] init];
    NSString *requestString = @"http://itunes.apple.com/us/rss/topsongs/limit=10/json";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    self.connection = [[NSURLConnection alloc] initWithRequest:req
                                                      delegate:self
                                              startImmediately:YES];
}

// This method will be called several times as the data arrives
- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    // Add the incoming chunk of data to the container we are keeping
    // The data always comes in the correct order
    [self.jsonData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    // Clear out any of the objects we were using to perform the request
    self.connection = nil;
    self.jsonData = nil;
    // Get the description of the error and alert the user
    NSString *errString = [error localizedDescription];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
                                                 message:errString
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
[av show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[self jsonData]
                                                               options:0
                                                                 error:nil];
    
    BNRRSSFeed *c = [[BNRRSSFeed alloc] init];
    [c readFromJSONObject:jsonObject];
    self.feed = c;
    
        NSLog(@"%@", self.feed.title);
    
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRRSSItem *i = self.feed.items[indexPath.row];
    self.webViewController.link = i.link;
    [self.navigationController pushViewController:self.webViewController
                                         animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.feed.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *c = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                         forIndexPath:indexPath];
    
    BNRRSSItem *i = self.feed.items[indexPath.row];
    c.textLabel.text = i.title;
    
    return c;
}
@end
