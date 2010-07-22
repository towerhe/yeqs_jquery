module IncludeHelper
  def include_jqueryhighcharts
    content_tag(:script, "", :type => 'text/javascript', :src => '/components/jqueryhighcharts/js/highcharts.js')
  end

  def include_jquery
    content_tag(:script, "", :type => 'text/javascript', :src => '/components/jquery/jquery-1.4.2.min.js')
  end

  def include_jquerytools
    content_tag(:script, "", :type => "text/javascript", :src => "/components/jquerytools/jquery.tools.min.js")
  end

  def include_jqueryrails
    content_tag(:script, "", :type => 'text/javascript', :src => '/components/jqueryrails/rails.js')
  end

  def include_jqueryui
    output = tag(:link, :type => 'text/css', :media => 'screen', :rel => 'stylesheet', :href => '/components/jqueryui/css/smoothness/jquery-ui-1.8.2.custom.css')
    output << "\n"
    output << content_tag(:script, "", :type => 'text/javascript', :src => '/components/jqueryui/js/jquery-ui-1.8.2.custom.min.js')
  end
end
