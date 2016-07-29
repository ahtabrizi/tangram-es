//
//  ViewController.h
//  TangramiOS
//
//  Created by Matt Blair on 8/25/14.
//  Copyright (c) 2014 Mapzen. All rights reserved.
//

#include "tangram.h"

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@protocol TangramGestureRecognizerDelegate <NSObject>
@optional
- (void)recognizer:(UIGestureRecognizer *)recognizer didRecognizeSingleTap:(CGPoint)location;
- (void)recognizer:(UIGestureRecognizer *)recognizer didRecognizeDoubleTap:(CGPoint)location;
- (void)recognizer:(UIGestureRecognizer *)recognizer didRecognizePanGesture:(CGPoint)location;
- (void)recognizer:(UIGestureRecognizer *)recognizer didRecognizePinchGesture:(CGPoint)location;
- (void)recognizer:(UIGestureRecognizer *)recognizer didRecognizeRotationGesture:(CGPoint)location;
- (void)recognizer:(UIGestureRecognizer *)recognizer didRecognizeShoveGesture:(CGPoint)location;
@end

struct TileID;
@interface ViewController : GLKViewController <UIGestureRecognizerDelegate>

@property (assign, nonatomic) Tangram::Map* map;
@property (assign, nonatomic) BOOL continuous;
@property (weak, nonatomic) id<TangramGestureRecognizerDelegate> gestureDelegate;

- (void)renderOnce;

@end