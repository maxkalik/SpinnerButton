<p align="center">
<img src="icon.jpg" style="border-radius: 60px" width="200" />
</p>

# SpinnerButton

[![CI Status](https://img.shields.io/travis/maxkalik/SpinnerButton.svg?style=flat)](https://travis-ci.org/maxkalik/SpinnerButton)
[![Version](https://img.shields.io/cocoapods/v/SpinnerButton.svg?style=flat)](https://cocoapods.org/pods/SpinnerButton)
[![License](https://img.shields.io/cocoapods/l/SpinnerButton.svg?style=flat)](https://cocoapods.org/pods/SpinnerButton)
[![Platform](https://img.shields.io/cocoapods/p/SpinnerButton.svg?style=flat)](https://cocoapods.org/pods/SpinnerButton)

## Example

<img src="spinner-button.gif" style="border: 1px solid silver; border-radius: 2px">

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

SpinnerButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SpinnerButton'
```

## Requirements

- [x] iOS 9.0+

## Usage example

#### Start loading animating

```objc
  [self.button startAnimating];
```

#### Stop loading animation

```objc
  [self.button stopAnimating];
```

#### Stroke line width

```objc
  [self.button setStrokeLineWidth:@2];
```

#### Single stroke color

```objc
  [self.button setStrokeColor:UIColor.redColor];
```

#### Make a gradient with colors

```objc
  NSArray *colors = [[NSArray alloc] initWithObjects:UIColor.blueColor, UIColor.redColor, UIColor.orangeColor, nil];
  [self.button setStrokeColors:colors];
```

#### Time interval of animation duration

```objc
  self.button.timeInterval = 0.5;
```

## Author

Max Kalik, maxkalik@gmail.com

## License

SpinnerButton is available under the MIT license. See the LICENSE file for more info.
