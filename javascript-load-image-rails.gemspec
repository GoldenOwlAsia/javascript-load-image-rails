require File.expand_path("../lib/javascript-load-image-rails/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "javascript-load-image-rails"
  s.version     = JavascriptLoadImage::Rails::VERSION
  s.authors     = ["Jonathan Nguyen"]
  s.email       = ["nganhquoc95@gmail.com"]
  s.homepage    = "https://github.com/nganhquoc95/javascript-load-image-rails"
  s.summary     = %q{Integrate the excellent Javascript-Load-Image-Rails javascript library with Rails asset pipeline}
  s.description = %q{A better way for new feature introduction and step-by-step users guide for your website and project.}

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "thor", "~> 0.14"
  s.add_runtime_dependency "sass-rails", ">= 3.2"
  s.add_development_dependency "bundler", "~> 1.0"
  s.add_development_dependency "rails", "> 3.0", "< 5"
  s.add_development_dependency "httpclient", "~> 2.6"
end
