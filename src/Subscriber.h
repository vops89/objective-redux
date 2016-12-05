#import <Foundation/Foundation.h>

@protocol Subscriber <NSObject>

- (void)nextState;

@end

@interface Subscriber : NSObject

@property (nonatomic, weak, readonly) id<Subscriber> subject;

- (instancetype)initWithSubject:(id<Subscriber>)subject;

@end
