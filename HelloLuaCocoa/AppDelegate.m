//
//  AppDelegate.m
//  HelloLuaCocoa
//
//  Created by Timothy Kukulski on 12/4/12.
//  Copyright (c) 2012 Timothy Kukulski. All rights reserved.
//

#import "AppDelegate.h"
#import <LuaCocoa/LuaCocoa.h>

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
   
    
    LuaCocoa* luaobjc_bridge = [[LuaCocoa alloc] init];
	struct lua_State* lua_state = [luaobjc_bridge luaState];
    //	struct lua_State* lua_state = luaL_newstate();
	NSString* the_path;
	int the_error;
	
	the_path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"lua"];
	//		the_error = luaL_loadfile(luaState, [the_path fileSystemRepresentation]);
	the_error = luaL_loadfile(lua_state, [the_path fileSystemRepresentation]);
	if(the_error)
	{
		//			NSLog(@"error");
		NSLog(@"luaL_loadfile failed: %s", lua_tostring(lua_state, -1));
		lua_pop(lua_state, 1); /* pop error message from stack */
		exit(0);
	}
    
    
    // Insert code here to initialize your application
}

@end
