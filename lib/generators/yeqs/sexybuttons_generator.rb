module Yeqs
  class SexybuttonsGenerator < Rails::Generators::Base
    def self.source_root
      @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), '/../../../public'))
    end

    def install
      directory 'components', 'public/components'
    end
  end
end
