Pod::Spec.new do |s|
  s.name             = 'bumper'
  s.version          = '1.1.0'
  s.summary          = 'A/B Testing debug helper framework for iOS'
  s.description      = <<-DESC
    Letgo Feature flags library.
    It not only allows Enabling/disabling parts of the code but select several cases for that parts.
    Includes a ruby script that generates all boilerplate for all A/B tests from a json file that
    contains the info.
    DESC

  s.homepage         = 'https://github.com/letgoapp/bumper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = {
    'Eli Kohen' => 'eli.kohen@letgo.com',
    'Albert Hernández' => 'albert@letgo.com'
  }
  s.source           = { :git => "git@github.com:letgoapp/bumper.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/letgo'

  s.ios.deployment_target = '8.0'
  s.platform     = :ios, '8.0'
  s.requires_arc = true



  s.default_subspec = 'Core'
  s.subspec 'Core' do |core|
  # subspec for users who don't want Rx components
    core.source_files = 'bumper/**/*'
    core.preserve_paths = [ 'scripts/**/*' ]
    core.frameworks = 'UIKit'
  end

  s.subspec 'RxObserving' do |rx|
    rx.dependency 'bumper/Core'
    rx.xcconfig =  
        { 'OTHER_SWIFT_FLAGS' => '$(inherited) -D RX_BUMPER' }
    rx.dependency 'RxSwift', '~> 4.0.0'
    rx.dependency 'RxCocoa', '~> 4.0.0'
  end
end
