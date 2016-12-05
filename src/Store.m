#import "Store.h"

@interface Store ()

@property (nonatomic, strong, readonly) id<Reducer> reducer;
@property (nonatomic, strong, readonly) id<State> state;
@property (nonatomic, strong, readonly) NSMutableArray<Subscriber *> *subscribers;

@end

@implementation Store

- (instancetype)initWithReducer:(id<Reducer>)reducer
{
    return [self initWithReducer:reducer state:nil];
}
- (instancetype)initWithReducer:(id<Reducer>)reducer state:(id<State>)state
{
    self = [super init];
    if (self) {
        _reducer = reducer;
        _state = state;
        _subscribers = [NSMutableArray new];
    }
    return self;
}

- (id<State>)getState
{
    return self.state;
}

- (id<Dispatchable>)dispatch:(id<Dispatchable>)dispatchable
{
    if (![dispatchable isKindOfClass:[Action class]]) {
        NSLog(@"Can't reduce %@ dispatchable", NSStringFromClass([dispatchable class]));
        return dispatchable;
    }
    
    _state = [self.reducer reduce:self.state action:dispatchable];
    
    for (NSInteger index = 0; index < self.subscribers.count; index++) {
        Subscriber *subscriber = [self.subscribers objectAtIndex:index];
        [subscriber.subject nextState];
    }
    
    return dispatchable;
}

- (void)subscribe:(id<Subscriber>)subject
{
    for (Subscriber *subscriber in self.subscribers) {
        if (subscriber.subject == subject) {
            return;
        }
    }
    
    Subscriber *subscriber = [[Subscriber alloc] initWithSubject:subject];
    [_subscribers addObject:subscriber];
    
    [subscriber.subject nextState];
}
- (void)unsubscribe:(id<Subscriber>)subject
{
    for (NSInteger index = 0; index < self.subscribers.count; index++) {
        Subscriber *subscriber = [self.subscribers objectAtIndex:index];
        if (subscriber.subject == subject) {
            [self.subscribers removeObjectAtIndex:index];
            return;
        }
    }
}

@end
