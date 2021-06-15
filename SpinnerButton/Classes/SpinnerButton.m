//  Created by Maksim Kalik on 6/5/21.

#import "SpinnerButton.h"

@interface SpinnerButton ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

#define DEFAULT_COLOR [UIColor colorWithRed:10.0f/255 green:120.0f/255  blue:1 alpha:1.0]

@implementation SpinnerButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.loading = NO;
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self setup];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.loading == true) {
        [self setupShapeLayer];
        [self setupGradientLayer];
        [self layoutIfNeeded];
    }
}

- (void)setup
{
    self.loading = NO;
    self.strokeColor = DEFAULT_COLOR;
    self.strokeLineWidth = 5;
    self.timeInterval = 2;
    self.shapeLayer = [[CAShapeLayer alloc] init];
    self.gradientLayer = [[CAGradientLayer alloc] init];
    [self setupCommon];
    [self setupTitle];
}

- (void)setupCommon
{
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.titleLabel.font = [UIFont fontWithName: @"futura" size: 20];
    [self setTitleColor: DEFAULT_COLOR forState: UIControlStateNormal];
    self.contentEdgeInsets = UIEdgeInsetsMake(8, 15, 8, 15);
}

- (void)setupTitle
{
    [self setTitle:@"Spinner Button" forState:UIControlStateNormal];
}

- (void)setupShapeLayer
{
    self.shapeLayer.lineWidth = self.strokeLineWidth;
    self.shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
    self.shapeLayer.strokeColor = UIColor.blackColor.CGColor;
    self.shapeLayer.fillColor = UIColor.clearColor.CGColor;
}

- (void)setupGradientLayer
{
    self.gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.gradientLayer.colors = [self getColors];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    self.gradientLayer.mask = self.shapeLayer;
}

- (void)setupAnimation
{
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = [NSNumber numberWithFloat:-1];
    strokeStartAnimation.toValue = [NSNumber numberWithFloat:1];
    
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = [NSNumber numberWithFloat:0];
    strokeEndAnimation.toValue = [NSNumber numberWithFloat:1];
    
    CAAnimationGroup *strokeAnimationGroup = [[CAAnimationGroup alloc] init];
    strokeAnimationGroup.duration = self.timeInterval;
    strokeAnimationGroup.repeatDuration = INFINITY;
    strokeAnimationGroup.animations = [[NSArray alloc] initWithObjects:strokeStartAnimation, strokeEndAnimation, nil];
    [self.shapeLayer addAnimation:strokeAnimationGroup forKey:nil];
}

- (void)startAnimating
{
    if (self.loading == NO) {
        self.loading = YES;
        self.gradientLayer.opacity = 0;
        [self.layer addSublayer:self.gradientLayer];
        [self performSelector:@selector(performAnimating) withObject:self afterDelay:0.3];
    }
}

- (void)performAnimating
{
    [self setupAnimation];
    [UIView animateWithDuration:0.1 animations:^{
        self.gradientLayer.opacity = 1;
    }];
}

- (void)stopAnimating
{
    if (self.loading == YES) {
        self.loading = NO;
        [UIView animateWithDuration:0.1 animations:^{
            self.gradientLayer.opacity = 0;
        } completion:^(BOOL finished) {
            [self.gradientLayer removeFromSuperlayer];
        }];
    }
}

- (NSMutableArray*)getColors
{
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

- (void)setHighlighted:(BOOL)highlighted
{
    if (!self.highlighted && highlighted) {
        [self hightlight];
    } else {
        [self unhightlight];
    }
}

- (void)hightlight
{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.5;
    }];
}

- (void)unhightlight
{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    }];
}

@end
