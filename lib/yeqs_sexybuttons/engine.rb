require "yeqs_sexybuttons"
require "rails"
require "active_support/dependencies"

module Yeqs
  module Sexybuttons 
    class Engine < Rails::Engine
    end
  end
end

ActiveSupport::Dependencies.load_paths << File.dirname(__FILE__) + "/../../app/helpers"
Dir[File.dirname(__FILE__) + "/../../app/helpers/**/*_helper.rb"].each do |file|
  ActionController::Base.helper "Yeqs::Sexybuttons::#{File.basename(file,'.rb').camelize}".constantize
end

