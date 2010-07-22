require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

module Yeqs
  module Jquery
    describe HighchartsHelper do
      before(:each) do
        @obj = Object.new
        @obj.extend(ActionView::Helpers::TagHelper)
        @obj.extend(HighchartsHelper)
      end
      
      it "should generate scripts to create the pie chart and the target div to which pie will be rendered" do
        series = [{ :data => [['A', 10], ['B', 20], ['C', 70]] }]
        html = @obj.pie(series) do |o|
          o.render_to = 'pie-container'
          o.title = 'Pie chart for test'
          o.ytitle = 'Y Axis'
          o.tooltip = "'<b>' + this.name + ': </b>' + this.y + '%'"
          o.width = 800
          o.height = 400
        end

        scripts = <<-SCRIPTS 
    $(function() {
      new Highcharts.Chart({
        chart: {
          renderTo: 'pie-container',
          margin: [50, 200, 60, 170]
        },
        title: {
          text: 'Pie chart for test'
        },
        yAxis: {
          title: {
            text: 'Y Axis'
          }
        },
        tooltip: {
          formatter: function() {
            return '<b>' + this.name + ': </b>' + this.y + '%';
          }
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
              enabled: true,
              formatter: function() {
                if (this.y > 5) return this.point.name;
              },
              color: 'white',
              style: {
                font: '13px Trebuchet MS, Verdana, sans-serif'
              }
            }
          }
        },
        series: [{"data":[["A",10],["B",20],["C",70]]}]
      });
    });
        SCRIPTS
        html.should == "<script type=\"text/javascript\">#{scripts}</script>".html_safe << "<div id=\"pie-container\" style=\"width:800px; height:400px;\"></div>".html_safe
      end
    end
  end
end
