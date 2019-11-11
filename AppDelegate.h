/*
 * Endless
 * Copyright (c) 2014-2017 joshua stein <jcs@jcs.org>
 *
 * See LICENSE file for redistribution terms.
 */

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "CookieJar.h"
#import "HSTSCache.h"

#import "JAHPAuthenticatingHTTPProtocol.h"
#import "CertificateAuthentication.h"

@class BrowsingViewController;

#define STATE_RESTORE_TRY_KEY @"state_restore_lock"

@interface AppDelegate : UIResponder <UIApplicationDelegate, JAHPAuthenticatingHTTPProtocolDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, atomic) BrowsingViewController *webViewController;
@property (strong, atomic) CookieJar *cookieJar;
@property (strong, atomic) HSTSCache *hstsCache;

@property (strong, atomic, readonly) NSString *defaultUserAgent;
@property (strong, atomic) NSURL *urlToOpenAtLaunch;

@property NSInteger socksProxyPort;
@property NSInteger httpProxyPort;
@property NSCache *sslCertCache;
@property CertificateAuthentication *certificateAuthentication;

+ (AppDelegate *)sharedAppDelegate;

- (BOOL)areTesting;
- (void)adjustMuteSwitchBehavior;

@end

