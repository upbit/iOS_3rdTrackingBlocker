#import "substrate.h"

#pragma mark - MobClick Exports

@interface MobClickApp : NSObject {}
@property(assign, nonatomic) BOOL logEnabled;
@end

@interface MobClickSession : NSObject {}
+(void)startWithAppkey:(id)appkey reportPolicy:(int)policy channelId:(id)anId;
@end

#pragma mark - MTA Exports

@interface MTAConfig : NSObject {}
@property(assign) BOOL statEnable;
@property(assign) BOOL debugEnable;
@end

@interface MTAWXOConfig : NSObject {}
@property(assign) BOOL statEnable;
@property(assign) BOOL debugEnable;
@end

@interface MTA4QCConfig : NSObject {}
@property(assign) BOOL statEnable;
@property(assign) BOOL debugEnable;
@end

#pragma mark - MobClick Hooks

%group MobClick

%hook MobClickApp
- (BOOL)logEnabled { return YES; }
%end

%hook MobClickSession
+ (void)startWithAppkey:(id)appkey reportPolicy:(int)policy channelId:(id)anId { %orig((id)@"", policy, anId); }	// disable MobClick
%end

%end	// end of MobClick


#pragma mark - MTA Hooks

%group MTA

%hook MTAConfig
- (BOOL)debugEnable { return YES; }
- (BOOL)statEnable { return NO; }		// disable MTA
%end

%hook MTAWXOConfig
- (BOOL)debugEnable { return YES; }
- (BOOL)statEnable { return NO; }       // disable MTAWXO
%end

%hook MTA4QCConfig
- (BOOL)debugEnable { return YES; }
- (BOOL)statEnable { return NO; }       // disable MTAWXO
%end

%end	// end of MTA


#pragma mark - %ctor

%ctor {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
	if (bundleIdentifier) {
		NSLog(@"3rd SDK TrackingBlocker - Loaded");

		%init(MobClick);
		%init(MTA);

	}

	[pool drain];
}
