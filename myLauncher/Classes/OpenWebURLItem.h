//
//  OpenWebURLItem.h
//  MyLauncher
//
//  Created by Nicolas Desjardins on 2012-06-26.
//
//

#import <Foundation/Foundation.h>
#import "MyLauncherGenericItem.h"

@interface OpenWebURLItem : NSObject<MyLauncherGenericItemDelegate, NSCoding>

@property(strong, nonatomic) NSString *url;
@property(strong, nonatomic) UIImage *icon;

-(id) initWithURL:(NSString*)url andIcon:(UIImage*)icon;

@end
