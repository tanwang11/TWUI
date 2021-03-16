#
# Be sure to run `pod lib lint TWUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TWUI'
  s.version          = '0.0.2'
  s.summary          = 'TWUI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'TWUI tool.'

  s.homepage         = 'https://github.com/tanwang11/TWUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tanwang11' => 'aihy@linrunwc.com' }
  s.source           = { :git => 'https://github.com/tanwang11/TWUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TWUI/Classes/TWUI.h'
  
  # s.resource_bundles = {
  #   'TWUI' => ['TWUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.frameworks = 'UIKit', 'Foundation', 'CoreText'
  
  s.dependency 'TWFoundation'
  s.dependency  'Masonry', '1.1.0'
  
  s.subspec 'UIViewController' do |ss|
      ss.source_files = 'TWUI/Classes/UIViewController/*.{h,m}'
  end
  
  s.subspec 'UIView' do |ss|
      ss.source_files = 'TWUI/Classes/UIView/*.{h,m}'
  end

  s.subspec 'UITextView' do |ss|
      ss.source_files = 'TWUI/Classes/UITextView/*.{h,m}'
  end

  s.subspec 'UITextField' do |ss|
      ss.source_files = 'TWUI/Classes/UITextField/*.{h,m}'
  end

  s.subspec 'UITableView' do |ss|
      ss.source_files = 'TWUI/Classes/UITableView/*.{h,m}'
  end

  s.subspec 'UIScrollView' do |ss|
      ss.source_files = 'TWUI/Classes/UIScrollView/*.{h,m}'
  end

  s.subspec 'UINavigationController' do |ss|
      ss.source_files = 'TWUI/Classes/UINavigationController/*.{h,m}'
  end

  s.subspec 'UILabel' do |ss|
      ss.dependency  'TWUI/UIView'
      ss.source_files = 'TWUI/Classes/UILabel/*.{h,m}'
  end

  s.subspec 'UIImage' do |ss|
      ss.dependency  'TWUI/UIView'
      ss.source_files = 'TWUI/Classes/UIImage/*.{h,m}'
  end

  s.subspec 'UIDevice' do |ss|
      ss.source_files = 'TWUI/Classes/UIDevice/*.{h,m}'
  end

  s.subspec 'UIButton' do |ss|
      ss.dependency  'TWUI/UIView'
      ss.source_files = 'TWUI/Classes/UIButton/*.{h,m}'
  end

  s.subspec 'UIAlertController' do |ss|
      ss.source_files = 'TWUI/Classes/UIAlertController/*.{h,m}'
  end

  s.subspec 'Response' do |ss|
      ss.source_files = 'TWUI/Classes/Response/*.{h,m}'
  end

  s.subspec 'ProgressView' do |ss|
      ss.source_files = 'TWUI/Classes/ProgressView/*.{h,m}'
  end

  s.subspec 'IToast' do |ss|
      ss.source_files = 'TWUI/Classes/IToast/*.{h,m}'
  end
  
  
end
