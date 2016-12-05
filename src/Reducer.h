#import <Foundation/Foundation.h>
#import "Action.h"
#import "State.h"

@protocol Reducer <NSObject>

- (id<State>)reduce:(id<State>)state action:(Action *)action;

@end
