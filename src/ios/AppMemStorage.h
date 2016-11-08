#import <UIKit/UIKit.h>
#import <Cordova/CDV.h>

@interface AppMemStorage : CDVPlugin {}

- (void) set:(CDVInvokedUrlCommand*)command;
- (void) get:(CDVInvokedUrlCommand*)command;
- (void) remove:(CDVInvokedUrlCommand*)command;
- (void) all:(CDVInvokedUrlCommand*)command;
- (void) count:(CDVInvokedUrlCommand*)command;
- (void) keys:(CDVInvokedUrlCommand*)command;
- (void) clear:(CDVInvokedUrlCommand*)command;

@end
