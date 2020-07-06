#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint sign_in_with_apple.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'touch_bar_macos'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin to interact with the touch bar of supported models of MacBook Pro, providing dynamic contextual controls.'
  s.description      = <<-DESC
  A macOS implementation of the touch_bar plugin.
                       DESC
  s.homepage         = 'https://github.com/vital-edu/touch_bar_flutter_plugin/tree/master/touch_bar_macos'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Eduardo Vital Alencar Cunha' => 'vital@hey.com' }
  s.source           = { :path => 'https://github.com/vital-edu/touch_bar_flutter_plugin/tree/master/touch_bar_macos' }
  s.source_files = 'Classes/**/*'
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.12.2'

  s.osx.deployment_target = '10.12.2'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end