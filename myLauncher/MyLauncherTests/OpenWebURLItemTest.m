//
//  MyLauncherTests.m
//  MyLauncherTests
//
//  Created by Nicolas Desjardins on 2012-06-26.
//
//

#import "OpenWebURLItemTest.h"
#import "OpenWebURLItem.h"
#import <OCMock/OCMock.h>


@interface OpenWebURLItemTest(){
    UIImage *icon;
    OpenWebURLItem *webItem;
}

@end

@implementation OpenWebURLItemTest

- (void)setUp
{
    [super setUp];
    NSString *path = [[NSBundle bundleForClass:[self class]]  pathForResource:@"Icon" ofType:@"png"];
    icon = [UIImage imageWithContentsOfFile:path];
    webItem = [[OpenWebURLItem alloc] initWithURL:@"http://TestURL.org" andIcon:icon];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testEncoding
{
    id mockCoder = [OCMockObject mockForClass:[NSCoder class]];
    [[mockCoder expect] encodeObject:@"http://TestURL.org" forKey:@"URL"];
    [[mockCoder expect] encodeObject:UIImagePNGRepresentation(icon) forKey:@"icon"];
    [webItem encodeWithCoder:mockCoder];
     
    [mockCoder verify];
}

- (void)testDecoding
{
    id mockDecoder = [OCMockObject mockForClass:[NSCoder class]];
    
    [[[mockDecoder stub] andReturn:@"http://TestURL.org"] decodeObjectForKey:@"URL"];
    [[[mockDecoder stub] andReturn:UIImagePNGRepresentation(icon)] decodeObjectForKey:@"icon"];
    
    OpenWebURLItem *decodedWebItem = [webItem initWithCoder:mockDecoder];
    
    STAssertEqualObjects([decodedWebItem url], @"http://TestURL.org", @"The URL");
    
    STAssertNotNil([decodedWebItem icon], @"The icon not nil");
    STAssertEqualObjects([[decodedWebItem icon] class], [UIImage class], @"The icon not nil");
}

@end
