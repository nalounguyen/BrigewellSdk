Pod::Spec.new do |spec|
  spec.name             = "BrigewellSdk"
  spec.version          = "1.0.0"
  spec.summary          = "A short description of BrigewellSdk "
  spec.description      = "A complete description of BrigewellSdk"
  spec.homepage         = 'https://'
  spec.license          = 'MIT'
  spec.author           = 'Nalou'
  spec.source           = { :git => 'git@bitbucket.org:tymerepos/tyme-networking-ios.git', :tag => spec.version.to_s }
  spec.swift_version    = '5.0'

  spec.static_framework = false
  spec.requires_arc     = true
  spec.source_files     = 'BrigewellSdk/**/*.{swift, plist, h, m}'
#   spec.resources = 'BrigewellSdk/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,json}'
  spec.ios.deployment_target     = '16.0'
  
  # dependency
  spec.dependency 'RxCocoa'
  spec.dependency 'RxSwift'
  spec.dependency 'Swinject', '2.8.3'
end
