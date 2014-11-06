//
//  NoUninstall.xm
//  NoUninstall
//
//  Created by Ryan Burke on 02.01.2014.
//  Copyright (c) 2014 Ryan Burke. All rights reserved.
//
#import <Foundation/Foundation.h>
#include <substrate.h>

%group main

%hook SBIconController

	-(BOOL)allowsUninstall {

		CFPreferencesAppSynchronize(CFSTR("com.ryanburke.nouninstallsettings"));
		CFPropertyListRef value = CFPreferencesCopyAppValue(CFSTR("enabled"), CFSTR("com.ryanburke.nouninstallsettings"));

		return !value;
	}

%end

%end


%ctor {
	@autoreleasepool {
		%init(main);
	}
}
