#
# Be sure to run `pod lib lint SpinnerButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SpinnerButton'
  s.version          = '0.1.2'
  s.summary          = 'UIKit button with loading state'
  s.description      = '<<-DESC
  Modified UIButton with loading state created as a stroke spinned around the button.
  The component has two state: default state without spinning stroke and loading state with spinning stroke.
                       DESC'
  s.homepage         = 'https://github.com/maxkalik/SpinnerButton'
  s.screenshots      = 'https://www.maxkalik.com/images/spinner-button.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'maxkalik' => 'maxkalik@gmail.com' }
  s.source           = { :git => 'https://github.com/maxkalik/SpinnerButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/maxkalik'
  s.ios.deployment_target = '9.0'
  s.source_files     = 'SpinnerButton/Classes/**/*'
  s.frameworks       = 'UIKit'
end
