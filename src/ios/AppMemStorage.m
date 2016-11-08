#import "AppMemStorage.h"

@implementation AppMemStorage

NSMutableDictionary* dict;
CDVPluginResult* nilKeyErrResult;

- (void)pluginInitialize
{
    dict = [NSMutableDictionary dictionary];
    nilKeyErrResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: @"key must be given"];
}

- (void)set: (CDVInvokedUrlCommand*)command
{
    NSString* key = (NSString*)[command.arguments objectAtIndex:0];
    NSString* value = (NSString*)[command.arguments objectAtIndex:1];

    if (key == nil) {
        [self.commandDelegate sendPluginResult:nilKeyErrResult callbackId:command.callbackId];
        return;
    }

    dict[key] = value; // [dict setObject:value forKey:key];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)get: (CDVInvokedUrlCommand*)command
{
    NSString* key = (NSString*)[command.arguments objectAtIndex:0];

    if (key == nil) {
        [self.commandDelegate sendPluginResult:nilKeyErrResult callbackId:command.callbackId];
        return;
    }

    CDVPluginResult* pluginResult;

    NSString* value = dict[key]; // [dict objectForKey:key];

    if (value == nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: value];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)remove: (CDVInvokedUrlCommand*)command
{
    NSString* key = (NSString*)[command.arguments objectAtIndex:0];

    if (key == nil) {
        [self.commandDelegate sendPluginResult:nilKeyErrResult callbackId:command.callbackId];
        return;
    }

    [dict removeObjectForKey:key];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)all: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary: dict];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)count: (CDVInvokedUrlCommand*)command
{
    NSUInteger count = [dict count];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt: (int)count];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)keys: (CDVInvokedUrlCommand*)command
{
    NSArray<NSString*> *keys = [dict allKeys];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray: keys];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)clear: (CDVInvokedUrlCommand*)command
{
    [dict removeAllObjects];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
