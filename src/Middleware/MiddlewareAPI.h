#import <Foundation/Foundation.h>
#import "Store.h"

@protocol Middleware;

@interface MiddlewareAPI : NSObject

- (instancetype)initWithMiddlewareStore:(Store *)middlewareStore nextMiddleware:(id<Middleware>)nextMiddleware store:(Store *)store;

- (id<State>)getState;
- (id<Dispatchable>)dispatch:(id<Dispatchable>)dispatchable;

- (id<Dispatchable>)next:(id<Dispatchable>)dispatchable;

@end
