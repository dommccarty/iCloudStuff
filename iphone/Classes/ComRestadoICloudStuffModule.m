/**
 * iCloudStuff
 *
 * Created by Your Name
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "ComRestadoICloudStuffModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComRestadoICloudStuffModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"d58f7970-b359-4283-a4e3-5597b09c4d9a";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.restado.iCloudStuff";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

- (BOOL) is_icloud_enabled:(id)args {
	id token = [[NSFileManager defaultManager] ubiquityIdentityToken];
	
	if (token == nil) {
		return NO;
	}
	
	else {
		return YES;
	}
	
}

-(id)getString:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString *keyString = [TiUtils stringValue:@"key" properties:args def:@""];
	[[NSUbiquitousKeyValueStore defaultStore] synchronize];
    NSString *storedString = [[NSUbiquitousKeyValueStore defaultStore] stringForKey:keyString];
       return storedString;
}

-(void)setString:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString *keyString = [TiUtils stringValue:@"key" properties:args def:@""];
    NSString *valueString = [TiUtils stringValue:@"value" properties:args def:@""];
    [[NSUbiquitousKeyValueStore defaultStore] setString:valueString forKey:keyString];
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
}

-(id)getAllValues:(id)args
{
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    return [[NSUbiquitousKeyValueStore defaultStore] dictionaryRepresentation];
}

-(void)removeObject:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString *keyString = [TiUtils stringValue:@"key" properties:args def:@""];
    [[NSUbiquitousKeyValueStore defaultStore] removeObjectForKey: keyString];
	[[NSUbiquitousKeyValueStore defaultStore] synchronize];
}


@end
