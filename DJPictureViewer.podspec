Pod::Spec.new do |s|
    s.name         = 'DJPictureViewer'
    s.version      = '0.0.1'
    s.summary      = 'A PictureViewer Which is easy to realize'
    s.homepage     = 'https://github.com/djliu328/DJPictureViewer'
    s.license      = 'MIT'
    s.authors      = {'dj_liu' => 'djliu328@126.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/djliu328/DJPictureViewer.git', :tag => s.version}
    s.source_files = 'DJPictureViewer/**/*.{h,m}'
    s.resource     = 'DJPictureViewer/DJPictureViewer.bundle'
    s.requires_arc = true
end
