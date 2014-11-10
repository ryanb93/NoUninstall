/**
 *  NoUninstall.xm
 *  NoUninstall
 *
 *  Created by Ryan Burke on 02.01.2014.
 *  Copyright (c) 2014 Ryan Burke. All rights reserved.
 */
#import <Foundation/Foundation.h>
#include <substrate.h>


%hook SBIconController

	/**
	 * Override the allowsUninstall metohd which controls if the application can be uninstalled
	 * from the device.
	 */
	-(BOOL)allowsUninstall {

		//Sync the latest version of the preferences.
		bool synced = CFPreferencesAppSynchronize(CFSTR("com.ryanburke.nouninstall"));
		//If the sync failed, lets just default to not allowing uninstall.
		if(!synced) return false;
		//Create a boolean object to hold the success value from next function.
		Boolean success;
		//Get the value of the "enabled" key from the preferences.
		bool result = CFPreferencesGetAppBooleanValue(CFSTR("enabled"), CFSTR("com.ryanburke.nouninstall"), &success);
		//If the enabled key existed and we got the value okay.
		if(success) {
			//Return the opposite of the value of the key. (if it's enabled then we want uninstall to be false).
			return !result;
		}
		//If for some reason we couldn't get the value just default to not allowing uninstall.
		return false;
	}

%end

%ctor {
	%init;
}
