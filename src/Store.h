#import <Foundation/Foundation.h>
#import "Action.h"
#import "State.h"
#import "Reducer.h"
#import "Subscriber.h"

@interface Store : NSObject

- (instancetype)initWithReducer:(id<Reducer>)reducer;
- (instancetype)initWithReducer:(id<Reducer>)reducer state:(id<State>)state;

- (id<State>)getState;
- (id<Dispatchable>)dispatch:(id<Dispatchable>)dispatchable;

- (void)subscribe:(id<Subscriber>)subject;
- (void)unsubscribe:(id<Subscriber>)subject;

@end
