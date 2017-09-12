Pod::Spec.new do |s|
  s.name             = "PartiallyEditField"
  s.version          = "0.3"
  s.summary          = "Open Source libary for add pre text on iOS"
  s.description      = "PartiallyEditField is a open-source and Clean code and sleek features. Start development using PartiallyEditField. Definitely you will be happy....! yeah.."
  s.homepage         = "https://github.com/isamankumara/PartiallyEditField"
  s.license          = 'MIT'
  s.author           = { "saman kumara" => "me@isamankumara.com" }
  s.source           = { :git => "https://github.com/isamankumara/PartiallyEditField.git", :tag => s.version.to_s, :submodules => true }

  s.requires_arc = true
  s.ios.deployment_target = "7.0"
  s.tvos.deployment_target = '9.0'

  s.source_files = 'PartiallyEditField/PartiallyEditField.h'
  s.public_header_files = 'PartiallyEditField/*.h'

end
