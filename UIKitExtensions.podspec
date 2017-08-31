#
# Be sure to run `pod lib lint UIKitExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UIKitExtensions'
  s.version          = '0.2.3'
  s.summary          = 'UIKitExtensions adds usefull features to UIKit classes.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
UIKitExtensions adds usefull features to UIKit classes as fadeIn to UIView animation or random to UIColor. 
                       DESC

  s.homepage         = 'https://github.com/leloupnicolas/UIKitExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nicolas LELOUP' => 'nicolasleloup.nl@gmail.com' }
  s.source           = { :git => 'https://github.com/leloupnicolas/UIKitExtensions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/leloupnicolas'

  s.ios.deployment_target = '8.0'

  s.source_files = 'UIKitExtensions'

  s.dependency 'SnapKit', '~> 3.1.2'
end
