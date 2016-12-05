#import "Store.h"
#import "Middleware.h"

@interface MiddlewareStore : Store

- (instancetype)initWithReducer:(id<Reducer>)reducer state:(id<State>)state middlewares:(NSArray<id<Middleware>> *)middlewares;
- (instancetype)initWithReducer:(id<Reducer>)reducer middlewares:(NSArray<id<Middleware>> *)middlewares;

@end
