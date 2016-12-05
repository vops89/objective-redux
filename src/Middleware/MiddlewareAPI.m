#import "MiddlewareAPI.h"
#import "Middleware.h"

@interface MiddlewareAPI ()

@property (nonatomic, strong, readonly) Store *middlewareStore;
@property (nonatomic, strong, readonly) id<Middleware> nextMiddleware;
@property (nonatomic, strong, readonly) Store *store;

@end

@implementation MiddlewareAPI

- (instancetype)initWithMiddlewareStore:(Store *)middlewareStore nextMiddleware:(id<Middleware>)nextMiddleware store:(Store *)store
{
    self = [super init];
    if (self) {
        _middlewareStore = middlewareStore;
        _nextMiddleware = nextMiddleware;
        _store = store;
    }
    return self;
}

- (id<State>)getState
{
    return [self.middlewareStore getState];
}
- (id<Dispatchable>)dispatch:(id<Dispatchable>)dispatchable
{
    return [self.middlewareStore dispatch:dispatchable];
}

- (id<Dispatchable>)next:(id<Dispatchable>)dispatchable
{
    return self.nextMiddleware ? [self.nextMiddleware dispatch:dispatchable] : [self.store dispatch:dispatchable];
}

@end
