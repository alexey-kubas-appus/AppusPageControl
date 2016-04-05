#
#  Be sure to run `pod spec lint AppusPageControl.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "AppusPageControl"
  s.version      = "0.0.1"
  s.summary      = "AppusPageControl allow you to use customisable page control with many featues"
  s.homepage     = "http://appus.pro"
s.license      = { :type => "Apache", :file => "LICENSE" }
  s.author             = { "Alexey Kubas" => "alexey.kubas@appus.me" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/alexey-kubas-appus/AppusPageControl.git", :tag => "0.0.2" }
  s.source_files = "AppusPageControl", "AppusPageControl/*"
  s.frameworks             = 'Foundation', 'UIKit'
  s.requires_arc = true
end
