source "http://rubygems.org"

gem "rails", "3.0.0.rc"

group :develpment do
  if RUBY_VERSION < '1.9'
    gem "ruby-debug", ">= 0.10.3"
  end
end

group :test do
  gem "rspec-rails", ">= 2.0.0.beta"
  gem "capybara", ">= 0.3.8"
  gem "sqlite3-ruby", :require => "sqlite3"
end
