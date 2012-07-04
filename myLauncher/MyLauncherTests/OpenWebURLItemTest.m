//
//  MyLauncherTests.m
//  MyLauncherTests
//
//  Created by Nicolas Desjardins on 2012-06-26.
//
//

#import "OpenWebURLItemTest.h"
#import "OpenWebURLItem.h"
#import "OCMockObject.h"


@interface OpenWebURLItemTest(){
    UIImage *icon;
    OpenWebURLItem *webItem;
}

@end

@implementation OpenWebURLItemTest

- (void)setUp
{
    [super setUp];
    icon = [UIImage imageNamed:@"Icon.png"];
    webItem = [[OpenWebURLItem alloc] initWithURL:@"http://TestURL.org" andIcon:icon];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testEncoding
{
    NSCoder *coder;
    
    id mock = [OCMockObject partialMockForObject:coder];
    
    
//    NSMutableData *data = [[NSMutableData alloc] init];
//    coder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [webItem encodeWithCoder:mock];
     
    
//    NSCoder *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//    NSString *url = [decoder decodeObjectForKey:@"URL"];
//    STAssertEqualObjects(url, @"http://TestURL.org", @"The URL");
     
     //_icon = [UIImage imageWithData:[coder decodeObjectForKey:@"icon"]];
}


- (void)testDecoding
{
    
    NSMutableData *data = [[NSMutableData alloc] init];
    NSCoder *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    OpenWebURLItem *decodedWebItem = [webItem initWithCoder:decoder];
    
    STAssertEqualObjects([decodedWebItem url], @"http://TestURL.org", @"The URL");
    
    //_icon = [UIImage imageWithData:[coder decodeObjectForKey:@"icon"]];
    
}

@end
