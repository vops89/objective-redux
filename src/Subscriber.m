#import "Subscriber.h"

@implementation Subscriber

- (instancetype)initWithSubject:(id<Subscriber>)subject
{
    self = [super init];
    if (self) {
        _subject = subject;
    }
    return self;
}

@end
