//
//  OpenWebURLItem.m
//  MyLauncher
//
//  Created by Nicolas Desjardins on 2012-06-26.
//
//

#import "OpenWebURLItem.h"

@implementation OpenWebURLItem

-(void)start {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://google.com"]];
}

-(UIImage*)icon {
    return [UIImage imageNamed:@"google-icon.png"];
}

@end
