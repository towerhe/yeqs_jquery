module Yeqs
  module Jquery
    require 'yeqs_jquery/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  end
end

