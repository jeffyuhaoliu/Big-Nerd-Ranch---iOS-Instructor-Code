

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView ()

@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;

@end

@implementation BNRDrawView
- (id)initWithFrame:(CGRect)r
{
    self = [super initWithFrame:r];
    
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        
        // Don't let the autocomplete fool you on the next line,
        // make sure you are instantiating an NSMutableArray
        // and not an NSMutableDictionary!
        self.finishedLines = [[NSMutableArray alloc] init];
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.multipleTouchEnabled = YES;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for(UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        BNRLine *line = [[BNRLine alloc] init];
        line.begin = location;
        line.end = location;
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    // Update linesInProcess with moved touches
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];

        // Find the line for this touch
        BNRLine *line = self.linesInProgress[key];

        // Update the line
        line.end = [t locationInView:self];
    }
    // Redraw
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    // Remove ending touches from dictionary
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];

        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    // Redraw
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches
                withEvent:(UIEvent *)events
{
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    void (^strokeLine)(BNRLine *) = ^(BNRLine *line) {
        UIBezierPath *bp = [UIBezierPath bezierPath];
        bp.lineWidth = 10;
        bp.lineCapStyle = kCGLineCapRound;
        [bp moveToPoint:line.begin];
        [bp addLineToPoint:line.end];
        [bp stroke];
    };
    
    // Draw complete lines in black
    [[UIColor blackColor] set];
    for (BNRLine *line in self.finishedLines) {
        strokeLine(line);
    }
    // Draw lines in process in red (don't copy and paste the previous for loop, it's
    // way different)
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProgress) {
        strokeLine(self.linesInProgress[key]);
    } 
}
@end
