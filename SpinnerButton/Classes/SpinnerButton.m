//  Created by Maksim Kalik on 6/5/21.

#import "SpinnerButton.h"

@interface SpinnerButton ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation SpinnerButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.loading = NO;
        self.strokeColor = UIColor.systemBlueColor;
        self.shapeLayer = [[CAShapeLayer alloc] init];
        self.gradientLayer = [[CAGradientLayer alloc] init];
        [self setupCommon];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.loading == true) {
        [self setupShapeLayer];
        [self setupGradientLayer];
        [self layoutIfNeeded];
    }
}

- (void)startAnimating {
    if (self.loading == NO) {
        self.loading = YES;
        self.gradientLayer.opacity = 0;
        [self.layer addSublayer:self.gradientLayer];
        [self performSelector:@selector(performAnimating) withObject:self afterDelay:0.3];
    }
}

- (void)performAnimating {
    [self setupAnimation];
    [UIView animateWithDuration:0.1 animations:^{
        self.gradientLayer.opacity = 1;
    }];
}

- (void)stopAnimating {
    if (self.loading == YES) {
        [UIView animateWithDuration:0.1 animations:^{
            self.gradientLayer.opacity = 0;
        } completion:^(BOOL finished) {
            [self.gradientLayer removeFromSuperlayer];
            self.loading = NO;
        }];
    }
}

- (void)setupCommon {
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.titleLabel.font = [UIFont fontWithName: @"futura" size: 20];
    [self setTitleColor: UIColor.systemBlueColor forState: UIControlStateNormal];
    self.contentEdgeInsets = UIEdgeInsetsMake(8, 15, 8, 15);
}

- (void)setupShapeLayer {
    self.shapeLayer.lineWidth = [self getStrokeLineWidth];
    self.shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
    self.shapeLayer.strokeColor = UIColor.blackColor.CGColor;
    self.shapeLayer.fillColor = UIColor.clearColor.CGColor;
}

- (void)setupGradientLayer {
    self.gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.gradientLayer.colors = [self getColors];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    self.gradientLayer.mask = self.shapeLayer;
}

- (void)setupAnimation {
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = [NSNumber numberWithFloat:-1];
    strokeStartAnimation.toValue = [NSNumber numberWithFloat:1];
    
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = [NSNumber numberWithFloat:0];
    strokeEndAnimation.toValue = [NSNumber numberWithFloat:1];
    
    CAAnimationGroup *strokeAnimationGroup = [[CAAnimationGroup alloc] init];
    strokeAnimationGroup.duration = [self getTimeInterval];
    strokeAnimationGroup.repeatDuration = INFINITY;
    strokeAnimationGroup.animations = [[NSArray alloc] initWithObjects:strokeStartAnimation, strokeEndAnimation, nil];
    [self.shapeLayer addAnimation:strokeAnimationGroup forKey:nil];
}

- (NSMutableArray*)getColors {
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    if (self.strokeColors != NULL) {
        for (UIColor *color in self.strokeColors) {
            [colors addObject:(id)color.CGColor];
        }
    } else {
        [colors addObject:(id)self.strokeColor.CGColor];
        [colors addObject:(id)self.strokeColor.CGColor];
    }
    return colors;
}

- (CGFloat)getStrokeLineWidth {
    if (self.strokeLineWidth != NULL) {
        return [self.strokeLineWidth doubleValue];
    } else {
        return 5;
    }
}


- (CFTimeInterval)getTimeInterval {
    if (self.timeInterval > 0) {
        return self.timeInterval;
    } else {
        return 1.5;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    if (!self.highlighted && highlighted) {
        [self hightlight];
    } else {
        [self unhightlight];
    }
}

- (void)hightlight {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.5;
    }];
}

- (void)unhightlight {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    }];
}

@end
