#
#  Be sure to run `pod spec lint ZZJsonToModel.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
	
  #类库的名称
  s.name         = "ZZJsonToModel"
  #库的版本
  s.version      = "1.0.0"
  #介绍语
  s.summary      = "A Json to Model Tools."
  #Github上项目地址               
  s.homepage     = "https://github.com/zhangs3721/ZZJsonToModel"
  #许可证
  s.license      = "MIT"
  #作者
  s.author       = { "zhangs3721" => "461818526@qq.com" }
  #项目的https链接地址
  s.source       = { :git => "https://github.com/zhangs3721/ZZJsonToModel.git", :tag => "#{s.version}" }
  #要共享的代码，这里是ZGRSAEncryptor下面的所有代码
  s.source_files = "ZZMonster/ZZMonster/*.{h,m}"
  #zhang
  #s.exclude_files = "ZZMonster/ZZMonster"
  s.frameworks   = "Foundation"
  s.platform     = :ios, "8.0"
end
