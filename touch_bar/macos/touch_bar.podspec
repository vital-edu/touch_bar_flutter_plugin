#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'touch_bar'
  s.version          = '0.0.1'
  s.summary          = 'No-op implementation of the macos touch_bar to avoid build issues on macos'
  s.description      = <<-DESC
  No-op implementation of the touch_bar plugin to avoid build issues on macos.
  https://github.com/flutter/flutter/issues/46618
                       DESC
  s.homepage         = 'https://github.com/vital-edu/touch_bar_flutter_plugin/tree/master/touch_bar'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Eduardo Vital Alencar Cunha' => 'vital@hey.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.platform = :osx
  s.osx.deployment_target = '10.11'
end
