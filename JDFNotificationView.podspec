#
# Be sure to run `pod lib lint JDFNotificationView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JDFNotificationView"
  s.version          = "1.0"
  s.summary          = "A UIView subclass for easily showing simple notifications to the user."
  s.description      = <<-DESC
                        JDFNotificationView is a simple UIView subclass that makes it easy to show simple notifications to the user without getting in their way.
                       DESC
  s.homepage         = "https://github.com/JoeFryer/JDFNotificationView"
  s.license          = 'MIT'
  s.author           = { "Joe Fryer" => "joe.d.fryer@gmail.com" }
  s.source           = { :git => "https://github.com/JoeFryer/JDFNotificationView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/JoeFryer88'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'JDFNotificationView' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'UIKit'
end
