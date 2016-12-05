#import <Foundation/Foundation.h>
#import "Dispatchable.h"

/**
 * @class Action
 * @discussion <code>Action</code> is a base <code><Dispatchable></code> implementation.
 * Reducers can dispatch only that type of <code><Dispatchable></code>.
 */
@interface Action : NSObject <Dispatchable>

@property (nonatomic, assign, readonly) NSInteger type;
@property (nonatomic, strong, readonly) NSDictionary *payload;

+ (instancetype)actionWithType:(NSInteger)type;
+ (instancetype)actionWithType:(NSInteger)type payload:(NSDictionary *)payload;
- (instancetype)initWithType:(NSInteger)type payload:(NSDictionary *)payload;

@end
