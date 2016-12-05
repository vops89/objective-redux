#import "Action.h"

@implementation Action

+ (instancetype)actionWithType:(NSInteger)type
{
    return [self actionWithType:type payload:nil];
}
+ (instancetype)actionWithType:(NSInteger)type payload:(NSDictionary *)payload
{
    return [[self alloc] initWithType:type payload:payload];
}
- (instancetype)initWithType:(NSInteger)type payload:(NSDictionary *)payload
{
    self = [super init];
    if (self) {
        _type = type;
        _payload = payload;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; type: %ld; payload: %@>", NSStringFromClass([self class]), self, (long)_type, _payload != nil ? NSStringFromClass([_payload class]) : @"nil"];
}

@end
