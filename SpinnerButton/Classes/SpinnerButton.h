//  Created by Maksim Kalik on 6/5/21.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface SpinnerButton : UIButton

#pragma mark - Properties

/// A boolean value indicating a button loading state
@property (nonatomic, assign, getter=isLoading) BOOL loading;

/// Define a color of the animated stroke
@property (nonatomic, strong) IBInspectable UIColor *strokeColor;

/// Define mulitple colors to make gradient in the animated stroke
@property (nonatomic, strong) NSArray *strokeColors;

/// Stroke line width of the animated border (default: 5)
@property (nonatomic, assign) IBInspectable CGFloat strokeLineWidth;

/// Define a corner radius (default: 10)
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

/// Time interval of animation duration
@property (nonatomic, assign) IBInspectable double timeInterval;

#pragma mark - Methods

/// Start loading animation
- (void)startAnimating;

/// Stop loading animation
- (void)stopAnimating;

@end

NS_ASSUME_NONNULL_END

