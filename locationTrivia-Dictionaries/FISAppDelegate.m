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
    if (range.length > 0 || range.length > [location count]) {
        return [location[@"name"] substringWithRange:range];
    }
    return location[@"name"];
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
    NSUInteger keyCount = [keys count];
    NSArray *propertyArray = @[@"name", @"latitude", @"longitude"];
    if ((keyCount == [propertyArray count] && [keys containsObject:propertyArray])) {
        return TRUE;
    }
    return FALSE;
}
- (NSDictionary *)locationNamed:(NSString *)name
                    inLocations:(NSArray *)locations {
    return locations[0];
}


@end
