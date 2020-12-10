#
#  Be sure to run `pod spec lint StringAttribute.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |s|
  s.name = 'StringAttribute'
  s.version = '0.3.2'
  s.license = 'MIT'
  s.homepage = 'https://github.com/bannzai/StringAttribute/'
  s.summary = 'StringAttribute is simple to write about NSAttributedString'
  s.authors = { 'bannzai' => 'kingkong999yhirose@gmail.com' }
  s.source = { :git => 'https://github.com/bannzai/StringAttribute.git', :tag => s.version }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.2'

  s.source_files = 'StringAttribute/Sources/*.swift'
end
