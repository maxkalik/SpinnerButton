//  Created by Maksim Kalik on 6/5/21.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpinnerButton : UIButton

@property (nonatomic, assign, getter=isWorking) BOOL loading;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, strong, nullable) NSArray *strokeColors;
@property (nonatomic, strong, nullable) NSNumber *strokeLineWidth;
@property (nonatomic, assign) CFTimeInterval timeInterval;

- (void)startAnimating;
- (void)stopAnimating;

@end

NS_ASSUME_NONNULL_END

