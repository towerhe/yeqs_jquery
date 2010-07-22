module Yeqs
  module Generators
    class JqueryGenerator < Rails::Generators::NamedBase
      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), '/../../../..'))
      end

      def install
        if file_name.eql? 'core'
          directory "public/components/jquery", "public/components/jquery"
        else
          directory "public/components/jquery#{file_name}", "public/components/jquery#{file_name}"
        end
      end
    end
  end
end
