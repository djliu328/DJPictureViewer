Pod::Spec.new do |s|
    s.name         = 'DJStatusBarHUD'
    s.version      = '0.0.2'
    s.summary      = 'The easily and conveniently use of statusBar'
    s.homepage     = 'https://github.com/djliu328/DJStatusBarHUD'
    s.license      = 'MIT'
    s.authors      = {'dj_liu' => 'djliu328@126.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/djliu328/DJStatusBarHUD.git', :tag => s.version}
    s.source_files = 'DJStatusBarHUD/**/*.{h,m}'
    s.resource     = 'DJStatusBarHUD/DJStatusBarHUD.bundle'
    s.requires_arc = true
end
