#import "MiddlewareStore.h"

@interface MiddlewareStore ()

@property (nonatomic, strong, readonly) Store *store;
@property (nonatomic, strong, readonly) id<Middleware> middleware;

@end

@implementation MiddlewareStore

- (instancetype)initWithReducer:(id<Reducer>)reducer
{
    return [self initWithReducer:reducer state:nil middlewares:nil];
}
- (instancetype)initWithReducer:(id<Reducer>)reducer state:(id<State>)state
{
    return [self initWithReducer:reducer state:state middlewares:nil];
}
- (instancetype)initWithReducer:(id<Reducer>)reducer middlewares:(NSArray<id<Middleware>> *)middlewares
{
    return [self initWithReducer:reducer state:nil middlewares:middlewares];
}
- (instancetype)initWithReducer:(id<Reducer>)reducer state:(id<State>)state middlewares:(NSArray<id<Middleware>> *)middlewares
{
    self = [super init];
    if (self) {
        _store = [[Store alloc] initWithReducer:reducer state:state];
        
        id<Middleware> middleware = nil;
        MiddlewareAPI *api = [[MiddlewareAPI alloc] initWithMiddlewareStore:self nextMiddleware:nil store:_store];
        for (NSInteger index = middlewares.count - 1; index >= 0; index--) {
            middleware = [middlewares objectAtIndex:index];
            [middleware setAPI:api];
            
            api = [[MiddlewareAPI alloc] initWithMiddlewareStore:self nextMiddleware:middleware store:_store];
        }
        _middleware = middleware;
    }
    return self;
}

- (id<State>)getState
{
    return [self.store getState];
}
- (id<Dispatchable>)dispatch:(id<Dispatchable>)dispatchable
{
    if (self.middleware != nil) {
        return [self.middleware dispatch:dispatchable];
    }
    
    return [self.store dispatch:dispatchable];
}

- (void)subscribe:(id<Subscriber>)subject
{
    [self.store subscribe:subject];
}
- (void)unsubscribe:(id<Subscriber>)subject
{
    [self.store unsubscribe:subject];
}

@end
