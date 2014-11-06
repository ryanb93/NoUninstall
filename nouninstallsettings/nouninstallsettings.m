//
//  nouninstallsettings.m
//  nouninstallsettings
//
//  Created by Ryan Burke on 03.01.2014.
//  Copyright (c) 2014 Ryan Burke. All rights reserved.
//

#import "nouninstallsettings.h"

@implementation nouninstallsettingsListController

- (id)specifiers {
	if (_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"nouninstallsettings" target:self];
	}
    
	return _specifiers;
}

@end
