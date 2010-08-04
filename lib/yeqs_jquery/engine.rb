require "yeqs_jquery"
require "rails"

module Yeqs
  module Jquery
    class Engine < Rails::Engine
      initializer 'yeqs_jquery.helper' do |app|
        ActionView::Base.send :include, HighchartsHelper
        ActionView::Base.send :include, IncludeHelper
      end
    end
  end
end
