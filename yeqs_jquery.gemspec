require 'bundler'

Gem::Specification.new do |s|
  s.name = "yeqs_jquery"
  s.version = File.exists?('VERSION') ? File.read('VERSION') : ""
  s.date = Date.today.to_s
  s.platform = Gem::Platform::RUBY
  s.author = "Tower He"
  s.email = "towerhe@gmail.com"
  s.homepage = "http://github.com/towerhe/yeqs_jquery"
  s.summary = "Wrap all the jquery related components."
  s.description = <<-DESC
  Yeqs Jquery wraps all the jquery related components. It provides a generator for each component. You can use these generators to generate the assets of the components quickly.
  DESC

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "yeqs_jquery"

  s.add_bundler_dependencies

  s.files =  Dir.glob("{app,lib,public}/**/*") + %w(Gemfile MIT-LICENSE README.rdoc Rakefile VERSION yeqs_jquery.gemspec)
end
