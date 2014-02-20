//
//  Person.h
//  RaiseManChallenge
//
//  Created by Shawn Hooton on 2/19/14.
//  Copyright (c) 2014 Sixpanel LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *personName;
    float expectedRaise;
}

@property (readwrite, copy) NSString *personName;
@property (readwrite) float expectedRaise;

@end
