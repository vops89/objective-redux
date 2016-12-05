#import <Foundation/Foundation.h>
#import "MiddlewareAPI.h"

@protocol Middleware <NSObject>

- (void)setAPI:(MiddlewareAPI *)api;
- (id<Dispatchable>)dispatch:(id<Dispatchable>)dispatchable;

@end
