Pod::Spec.new do |s|
    s.name             = 'VUIComponents-Swift'
    s.version          = '0.1.4'
    s.summary          = 'Pod contains UI components developed in swift language'
    s.description      = 'A pod contains all swift UI components you need to use'
    s.homepage         = 'https://github.com/VodafoneEgypt/VUIComponents-Swift'
    s.license          = {:type => 'MIT', :file => 'LICENSE'}
    s.author           = {'VodafoneEgypt' => 'egypt.apps@vodafone.com'}
    s.source           = {:git => 'https://github.com/VodafoneEgypt/VUIComponents-Swift.git', :tag => s.version.to_s}
    
    s.ios.deployment_target = '9.0'
    s.source_files = 'VUIComponents-Swift/Classes/**/*.{swift}'
    s.resources = 'VUIComponents-Swift/Classes/**/*.{xib}'
    
    s.dependency 'VUIComponents'
    s.dependency 'SnapKit'
end
