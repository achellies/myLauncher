//
//  MyLauncherGenericItemTest.m
//  MyLauncher
//
//  Created by Nicolas Desjardins on 2012-07-04.
//
//

#import "MyLauncherGenericItemDelegate.h"
#import "MyLauncherGenericItemTest.h"
#import "MyLauncherViewController.h"
#import "MyLauncherGenericItem.h"

#import <OCMock/OCMock.h>

@implementation MyLauncherGenericItemTest

- (void)setUp
{
    [super setUp];

}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

- (void)testSelected
{
    id mockGenericDelegate = [OCMockObject mockForProtocol:@protocol(MyLauncherGenericItemDelegate)];
    
    [(id<MyLauncherGenericItemDelegate>)[mockGenericDelegate expect] start];
    
    MyLauncherGenericItem *genericItem = [[MyLauncherGenericItem alloc] initWithTitle:@"My Title" delegate:mockGenericDelegate deletable:YES];
    
    id mockParentController = [OCMockObject mockForClass:[MyLauncherViewController class]];
    [genericItem selected:mockParentController];
    
    [mockGenericDelegate verify];
}

-(void) testItemToSave
{
    id mockGenericDelegate = [OCMockObject mockForProtocol:@protocol(MyLauncherGenericItemDelegate)];
    
    MyLauncherGenericItem *genericItem = [[MyLauncherGenericItem alloc] initWithTitle:@"My Title" delegate:mockGenericDelegate deletable:YES];
    
    NSDictionary *itemsToSave = [genericItem itemToSave];
    
    NSData* savedData = [itemsToSave objectForKey:@"genericDelegate"];
    
    MyLauncherGenericItem *unarchived = [NSKeyedUnarchiver unarchiveObjectWithData:savedData];
    STAssertEqualObjects(mockGenericDelegate, unarchived, @"");
    
}

@end
