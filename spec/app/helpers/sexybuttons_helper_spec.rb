require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

module Yeqs
  module Sexybuttons
    describe SexybuttonHelper do
      before(:each) do
        @obj = Object.new
        @obj.extend(SexybuttonHelper)
      end
      
      it "should generate a simple sexybutton" do
        html = @obj.sexybutton do |b|
          b.type = 'submit'
          b.color = 'orange'
          b.image = 'ok'
          b.text = 'Simple Button'
        end

        html.should == '<button class="sexybutton sexysimple sexyorange" type="submit"><span class="ok">Simple Button</span></button>'
      end

      it "should generate a link" do
        html = @obj.sexybutton do |b|
          b.color = 'orange'
          b.text = 'Google'
          b.url = 'http://www.google.com'
        end

        html.should == '<a class="sexybutton sexysimple sexyorange" href="http://www.google.com">Google</a>'
      end
    end
  end
end
