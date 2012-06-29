//
//  OpenWebURLItem.m
//  MyLauncher
//
//  Created by Nicolas Desjardins on 2012-06-26.
//
//

#import "OpenWebURLItem.h"

@implementation OpenWebURLItem

@synthesize url = _url;
@synthesize icon = _icon;

-(id)initWithURL:(NSString*)url andIcon:(UIImage*)icon {
    if (self = [super init]) {
        _url = url;
        _icon = icon;
    }
    return self;
}

-(void)start {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_url]];
}

-(UIImage*)icon {
    return _icon;
}

- (id)initWithCoder:(NSCoder*)coder {
    _url = [coder decodeObjectForKey:@"URL"];
    _icon = [UIImage imageWithData:[coder decodeObjectForKey:@"icon"]];
    return self;
}

- (void)encodeWithCoder:(NSCoder*)coder {
    [coder encodeObject:_url forKey:@"URL"];
    
    NSData *data = UIImagePNGRepresentation(_icon);
    [coder encodeObject:data forKey:@"icon"];
}

@end
