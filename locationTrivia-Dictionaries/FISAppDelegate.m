//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                      toLength:(NSUInteger)length {
    NSRange range = NSMakeRange(0, length);
    NSUInteger locationCount = [location[@"name"] length];
    if (length >= locationCount) {
        return location[@"name"];
    } else {
        return [location[@"name"] substringWithRange:range];
    }
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude {
    
    NSMutableDictionary *locationNameDictionary = [[NSMutableDictionary alloc]init];
    NSNumber *numLatitude = @(latitude);
    NSNumber *numLongitude = @(longitude);
    [locationNameDictionary setValue:name forKey:@"name"];
    [locationNameDictionary setValue:numLatitude forKey:@"latitude"];
    [locationNameDictionary setValue:numLongitude forKey:@"longitude"];
    return locationNameDictionary;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *locationsArray = [[NSMutableArray alloc]init];
    for (NSDictionary *location in locations) {
        [locationsArray addObject:location[@"name"]];
    }
    return locationsArray;
}

- (BOOL)dictionaryIsValidLocation:NSDictionary {
    NSArray *keys = [NSDictionary allKeys];
    NSArray *propertyArray = @[@"name", @"latitude", @"longitude"];
    if ([[NSSet setWithArray:keys] isEqualToSet:[NSSet setWithArray:propertyArray]]) {
        return NSDictionary;
    } else {
        return NO;
    }
}
- (NSDictionary *)locationNamed:(NSString *)name
                    inLocations:(NSArray *)locations {
    for (NSDictionary *location in locations) {
        if (name == location[@"name"]) {
            return location;
        }
    }
    return nil; 
}

@end
