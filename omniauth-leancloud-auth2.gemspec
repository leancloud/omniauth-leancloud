# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-leancloud/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "paomian"
  gem.email         = "xpaomian@gmail.com"
  gem.description   = %q{OmniAuth Oauth2 strategy for leancloud.cn.}
  gem.summary       = %q{OmniAuth Oauth2 strategy for leancloud.cn.}
  #gem.homepage      = "https://github.com/beenhero/omniauth-weibo-oauth2"
  
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-leancloud"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::LeanCloudOauth::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end