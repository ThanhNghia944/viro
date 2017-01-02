//
//  VROVideoSurfaceManager.m
//  React
//
//  Created by Vik Advani on 3/24/16.
//  Copyright © 2016 Viro Media. All rights reserved.
//

#import "VRTVideoSurfaceManager.h"
#import "VRTVideoSurface.h"
#import "ViroUIManager.h"

@implementation VRTVideoSurfaceManager
RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(source, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(position, NSNumberArray)
RCT_EXPORT_VIEW_PROPERTY(rotation, NSNumberArray)
RCT_EXPORT_VIEW_PROPERTY(scale, NSNumberArray)
RCT_EXPORT_VIEW_PROPERTY(visible, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onTapViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onGazeViro, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(canTap, BOOL)
RCT_EXPORT_VIEW_PROPERTY(canGaze, BOOL)
RCT_EXPORT_VIEW_PROPERTY(transformBehaviors, NSArray<NSString *>)
RCT_EXPORT_VIEW_PROPERTY(opacity, float)
RCT_EXPORT_VIEW_PROPERTY(paused, BOOL)
RCT_EXPORT_VIEW_PROPERTY(loop, BOOL)
RCT_EXPORT_VIEW_PROPERTY(muted, BOOL)
RCT_EXPORT_VIEW_PROPERTY(volume, float)
RCT_EXPORT_VIEW_PROPERTY(onFinishViro, RCTDirectEventBlock)

- (VRTVideoSurface *)view
{
  return [[VRTVideoSurface alloc] initWithBridge:self.bridge];
}

RCT_EXPORT_METHOD(seekToTime:(nonnull NSNumber *)reactTag time:(NSInteger)time)
{
  [self.bridge.viroUIManager addUIBlock:^(__unused ViroUIManager *uiManager, NSDictionary<NSNumber *, VRTView *> *viewRegistry) {
    VRTView *view = viewRegistry[reactTag];
    if (![view isKindOfClass:[VRTVideoSurface class]]) {
      RCTLogError(@"Invalid view returned from registry, expecting VRTVideoSurface, got: %@", view);
    } else {
      VRTVideoSurface *component = (VRTVideoSurface *)view;
      [component seekToTime:time];
    }
  }];
}

@end