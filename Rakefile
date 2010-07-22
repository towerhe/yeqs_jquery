# encoding: UTF-8
require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'

require 'rspec/core'
require 'rspec/core/rake_task'

Rspec::Core::RakeTask.new(:spec)

task :default => :spec

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'YeqsJquery'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('app/**/*.rb')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

spec = eval(File.read('yeqs_jquery.gemspec'))
Rake::GemPackageTask.new(spec) do |pkg|
    pkg.gem_spec = spec
end

desc "Release the gem file #{spec.name}-#{spec.version}.gem"
task :release do
  system "gem push pkg/#{spec.name}-#{spec.version}.gem"
end

desc "Install #{spec.name}-#{spec.version}.gem"
task :install do
  system "gem install pkg/#{spec.name}-#{spec.version}.gem --no-ri --no-rdoc"
end

desc "uninstall #{spec.name}"
task :uninstall do
  system "gem uninstall #{spec.name}"
end
