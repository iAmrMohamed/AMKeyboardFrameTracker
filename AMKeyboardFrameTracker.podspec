Pod::Spec.new do |s|
    s.name             = 'AMKeyboardFrameTracker'
    s.version          = '1.0.0'
    s.summary          = 'Simple iOS Keyboard frame tracker for custom interactive Keyboard dismissal'
    
    s.homepage         = 'https://github.com/iAmrMohamed/AMKeyboardFrameTracker'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'iAmrMohamed' => 'iAmrMohamed@gmail.com' }
    s.source           = { :git => 'https://github.com/iAmrMohamed/AMKeyboardFrameTracker.git', :tag => s.version }
    s.social_media_url   = "https://twitter.com/iAmrMohamed"
    
    s.ios.deployment_target = '9.0'
    
    s.swift_version = '4.2'
    s.source_files = 'AMKeyboardFrameTracker/Classes/**/*'
    
    s.frameworks = 'UIKit'
end
