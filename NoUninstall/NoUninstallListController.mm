//
//  nouninstallsettings.m
//  nouninstallsettings
//
//  Created by Ryan Burke on 03.01.2014.
//  Copyright (c) 2014 Ryan Burke. All rights reserved.
//
#import <Preferences/PSListController.h>

@interface NoUninstallListController: PSListController {
}
@end

@implementation NoUninstallListController

- (id)specifiers {
	if (_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"NoUninstall" target:self] retain];
	}
	return _specifiers;
}

@end
