//
//  BNRViewController.m
//  TempChat
//
//  Created by Jonathan Blocksom on 1/9/13.
//  Copyright (c) 2013 Big Nerd Ranch, Inc. All rights reserved.
//

#import "BNRViewController.h"

#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>

@interface BNRViewController () {
    int _socketFD;

    dispatch_source_t _socketSource;
}

@property (weak, nonatomic) IBOutlet UITableView *messageTable;

@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation BNRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.messages = [[NSMutableArray alloc] init];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connect:(id)sender
{
    NSString *serverAddress = self.serverAddressField.text;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [self connectToServer:serverAddress];
//        sleep(1);
//
//        // Read welcome message
//        [self readFromSocket];
//        
//        // read first message
//        [self readFromSocket];
//        
//        NSTimer *timer = [[NSTimer alloc] initWithFireDate:nil
//                                                  interval:0.5
//                                                    target:self
//                                                  selector:@selector(readFromSocket)
//                                                  userInfo:nil
//                                                   repeats:YES];
//        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    });
}

#pragma mark - Socket communications

- (void)connectToServer:(NSString *)serverAddress
{
    // Get address information
    struct addrinfo hints, *res;
    
    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    
    getaddrinfo([serverAddress UTF8String], "8081", &hints, &res);
    
    // Simulate DNS latency
    sleep(3);
    
    // Create socket and connect
    _socketFD = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
    connect(_socketFD, res->ai_addr, res->ai_addrlen);
    
    fcntl(_socketFD, F_SETFL, O_NONBLOCK);
    
    // Create dispatch source for socket
    _socketSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_READ, _socketFD, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_event_handler(_socketSource, ^{
        [self readFromSocket];
    });
    dispatch_source_set_cancel_handler(_socketSource, ^{
        NSLog(@"Cancelled!");
        close(_socketFD);
        dispatch_suspend(_socketSource);
    });
    dispatch_resume(_socketSource);
}

- (void)readFromSocket
{
    // Read some data
    char buf[1024];
    int numBytesRead;
    numBytesRead = recv(_socketFD, buf, 1023, 0);
    if (numBytesRead == 0) {
        // Socket close
        NSLog(@"No data on socket, ERRNO = %s", strerror(errno));
        dispatch_source_cancel(_socketSource);
    }
    if (numBytesRead < 0) {
        // No data
        NSLog(@"No data on socket, ERRNO = %s", strerror(errno));
        return ;
    }
    buf[numBytesRead] = '\0';
    
    NSLog(@"Received %d bytes: %s", numBytesRead, buf);
    
    if (numBytesRead > 0) {
        NSString *message = [NSString stringWithCString:buf encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.messages addObject:message];
            [self.messageTable reloadData];
            
            // Typing hint: type dispatch_after to get autocomplete for the snippet below.
            int64_t delayInSeconds = 10.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self.messages removeObject:message];
                [self.messageTable reloadData];
            });
        });
    }
}

#pragma mark - Table data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.messages count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create an instance of UITableViewCell, with default appearance
    // Check for a reusable cell first, use that if it exists
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MessageCell"];
    }
    
    // Configure cell...
    cell.textLabel.text = self.messages[[indexPath row]];
    NSLog(@"Set to message %@", cell.textLabel.text);
    
    return cell;
}

@end
