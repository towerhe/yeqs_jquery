module SexybuttonHelper

  def sexybutton
    btn = SexyButton.new
    yield btn
    btn.to_html
  end

  private
  class SexyButton
    include ActionView::Helpers::TagHelper

    attr_accessor :tag_name
    attr_accessor :type
    attr_accessor :style
    attr_accessor :color
    attr_accessor :text
    attr_accessor :url
    attr_accessor :image

    def initialize
      self.tag_name = 'button'
      self.style = 'simple'
      self.color = 'black'
    end

    def to_html
      html_options = { :class => "sexybutton sexy#{style} sexy#{color}" }
      html_options.merge! :type => type if type
      if url
        html_options.merge! :href => url 
        self.tag_name = 'a'
      end

      content = image ? content_tag(:span, text, :class => image) : text
      content_tag(tag_name, content, html_options)
    end
  end
end
