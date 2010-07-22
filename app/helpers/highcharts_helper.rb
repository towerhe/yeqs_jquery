module HighchartsHelper
  def pie(series)
    options = Options.new
    yield options if block_given?
    output = content_tag(:script, generate_scripts(series, options), :type => 'text/javascript')
    output << content_tag(:div, "", :id => options.render_to, :style => "width:#{options.width}px; height:#{options.height}px;")
  end

  private
  class Options
    attr_accessor :render_to, :title, :ytitle, :tooltip, :width, :height

    def initialize
      self.render_to = 'chart-container'
      self.title = 'Title of the chart'
      self.ytitle = 'Y Axis'
      self.tooltip = "'<b>' + this.point.name + ': </b>' + this.y"
      self.width = 800
      self.height = 400
    end
  end

  def generate_scripts(series, options)
    scripts = <<-SCRIPTS
    $(function() {
      new Highcharts.Chart({
        chart: {
          renderTo: '#{options.render_to}',
          margin: [50, 200, 60, 170]
        },
        title: {
          text: '#{options.title}'
        },
        yAxis: {
          title: {
            text: '#{options.ytitle}'
          }
        },
        tooltip: {
          formatter: function() {
            return #{options.tooltip};
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
        series: #{series.to_json}
      });
    });
    SCRIPTS
    scripts.html_safe
  end

  DEFAULT_OPTIONS = {
    # chart START
    :chart => {
      :alignTicks => true,
      :backgroundColor => "#FFFFFF",
      :borderColor => "#4572A7",
      :borderRadius => 5,
      :borderWidth => 0,
      :className => "",
      :defaultSeriesType => "line",
      :ignoreHiddenSeries => true,
      :inverted => false,
      :margin => [50, 50, 70, 80],
      :marginTop => 50,
      :marginRight => 50,
      :marginBottom => 70,
      :marginLeft => 80,
      :plotBorderColor => "#C0C0C0",
      :plotBorderWidth => 0,
      :plotShadow => false,
      :shadow => false,
      :showAxes => false,
      :zoomType => ""
    }, # chart END
    # colors START
    :colors => [
      '#4572A7', 
      '#AA4643', 
      '#89A54E', 
      '#80699B', 
      '#3D96AE', 
      '#DB843D', 
      '#92A8CD', 
      '#A47D7C', 
      '#B5CA92'
    ], # colors END
    :credits => {
      :enabled => true,
      :href => "http://www.highcharts.com",
      :text => "Highcharts.com"
    },
    :global => {
      :useUTC => true
    },
    :labels => {
      :items => [{
        :html => "",
      }]
    },
    :lang => {
      :decimalPoint => ".",
      :downloadPNG => "Download PNG image",
      :downloadJPEG => "Download JPEG image",
      :downloadPDF => "Download PDF document",
      :downloadSVG => "Download SVG vector image",
      :exportButtonTitle => "Export to raster or vector image",
      :months => ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
      :printButtonTitle => "Print the chart",
      :thousandsSep => ",",
      :weekdays => ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    },
    :legend => {
      :align => "center",
      :borderRadius => 5,
      :borderWidth => 1,
      :enabled => true,
      :layout => "horizontal",
      :lineHeight => 16,
      :reversed => false,
      :shadow => false,
      :symbolPadding => 5,
      :symbolWidth => 30,
      :verticalAlign => "bottom",
      :x => 15,
      :y => 0
    },
    :loading => {
      :hideDuration => 100,
      :showDuration => 100
    },
    :plotOptions => {
      :area => {
        :fillOpacity => 0.75,
        :threshold => 0,
        :allowPointSelect => false,
        :animation => true,
        :cursor => '',
        :dataLabels => {
          :align => "center",
          :enabled => false,
          :rotation => 0,
          :x => 0,
          :y => -6
        },
        :enableMouseTracking => true,
        :lineWidth => 2,
        :marker => {
          :enabled => true,
          :lineColor => "#FFFFFF",
          :lineWidth => 0,
          :radius => 0,
          :states => {
            :hover => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0
            },
            :select => {
              :enabled => true,
              :lineColor => "#000000",
              :lineWidth => 0
            }
          }
        },
        :pointStart => 0,
        :pointInterval => 1,
        :selected => false,
        :shadow => true,
        :showCheckbox => false,
        :showInLegend => true,
        :states => {
          :hover => {
            :enabled => false,
            :lineWidth => 2,
            :marker => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0,
              :radius => 0
            }
          }
        },
        :stickyTracking => true,
        :visible => true
      },
      :areaspline => {
        :fillOpacity => 0.75,
        :threshold => 0,
        :allowPointSelect => false,
        :animation => true,
        :cursor => '',
        :dataLabels => {
          :align => "center",
          :enabled => false,
          :rotation => 0,
          :x => 0,
          :y => -6
        },
        :enableMouseTracking => true,
        :lineWidth => 2,
        :marker => {
          :enabled => true,
          :lineColor => "#FFFFFF",
          :lineWidth => 0,
          :radius => 0,
          :states => {
            :hover => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0
            },
            :select => {
              :enabled => true,
              :lineColor => "#000000",
              :lineWidth => 0
            }
          }
        },
        :pointStart => 0,
        :pointInterval => 1,
        :selected => false,
        :shadow => true,
        :showCheckbox => false,
        :showInLegend => true,
        :states => {
          :hover => {
            :enabled => false,
            :lineWidth => 2,
            :marker => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0,
              :radius => 0
            }
          }
        },
        :stickyTracking => true,
        :visible => true
      },
      :bar => {
        :borderColor => "#FFFFFF",
        :borderRadius => 0,
        :borderWidth => 1,
        :colorByPoint => false,
        :groupPadding => 0.2,
        :minPointLength => 0,
        :pointPadding => 0.1,
        :allowPointSelect => false,
        :animation => true,
        :cursor => '',
        :dataLabels => {
          :align => "left",
          :x => 5,
          :y => 0,
          :enabled => false,
          :rotation => 0
        },
        :enableMouseTracking => true,
        :lineWidth => 2,
        :marker => {
          :enabled => true,
          :lineColor => "#FFFFFF",
          :lineWidth => 0,
          :radius => 0,
          :states => {
            :hover => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0
            },
            :select => {
              :enabled => true,
              :lineColor => "#000000",
              :lineWidth => 0
            }
          }
        },
        :pointStart => 0,
        :pointInterval => 1,
        :selected => false,
        :shadow => true,
        :showCheckbox => false,
        :showInLegend => true,
        :states => {
          :hover => {
            :brightness => 0.1,
            :enabled => false,
            :lineWidth => 2,
            :marker => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0,
              :radius => 0
            }
          }
        },
        :stickyTracking => true,
        :visible => true
      },
      :column => {
        :borderColor => "#FFFFFF",
        :borderRadius => 0,
        :borderWidth => 1,
        :colorByPoint => false,
        :groupPadding => 0.2,
        :minPointLength => 0,
        :pointPadding => 0.1,
        :allowPointSelect => false,
        :animation => true,
        :cursor => '',
        :dataLabels => {
          :align => "center",
          :enabled => false,
          :rotation => 0,
          :x => 0,
          :y => -6
        },
        :enableMouseTracking => true,
        :lineWidth => 2,
        :marker => {
          :enabled => true,
          :lineColor => "#FFFFFF",
          :lineWidth => 0,
          :radius => 0,
          :states => {
            :hover => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0
            },
            :select => {
              :enabled => true,
              :lineColor => "#000000",
              :lineWidth => 0
            }
          }
        },
        :pointStart => 0,
        :pointInterval => 1,
        :selected => false,
        :shadow => true,
        :showCheckbox => false,
        :showInLegend => true,
        :states => {
          :hover => {
            :brightness => 0.1,
            :enabled => false,
            :lineWidth => 2,
            :marker => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0,
              :radius => 0
            }
          }
        },
        :stickyTracking => true,
        :visible => true
      },
      :line => {
        :step => false,
        :allowPointSelect => false,
        :animation => true,
        :cursor => '',
        :dataLabels => {
          :align => "center",
          :enabled => false,
          :rotation => 0,
          :x => 0,
          :y => -6
        },
        :enableMouseTracking => true,
        :lineWidth => 2,
        :marker => {
          :enabled => true,
          :lineColor => "#FFFFFF",
          :lineWidth => 0,
          :radius => 0,
          :states => {
            :hover => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0
            },
            :select => {
              :enabled => true,
              :lineColor => "#000000",
              :lineWidth => 0
            }
          }
        },
        :pointStart => 0,
        :pointInterval => 1,
        :selected => false,
        :shadow => true,
        :showCheckbox => false,
        :showInLegend => true,
        :states => {
          :hover => {
            :enabled => false,
            :lineWidth => 2,
            :marker => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0,
              :radius => 0
            }
          }
        },
        :stickyTracking => true,
        :visible => true
      },
      :pie => {
        :borderColor => "#FFFFFF",
        :borderWidth => 1,
        :center => ['50%', '50%'],
        :innerSize => 0,
        :size => "90%",
        :slicedOffset => 10,
        :allowPointSelect => false,
        :animation => true,
        :cursor => '',
        :dataLabels => {
          :align => "center",
          :enabled => false,
          :rotation => 0,
          :x => 0,
          :y => -6
        },
        :enableMouseTracking => true,
        :lineWidth => 2,
        :marker => {
          :enabled => true,
          :lineColor => "#FFFFFF",
          :lineWidth => 0,
          :radius => 0,
          :states => {
            :hover => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0
            },
            :select => {
              :enabled => true,
              :lineColor => "#000000",
              :lineWidth => 0
            }
          }
        },
        :pointStart => 0,
        :pointInterval => 1,
        :selected => false,
        :shadow => true,
        :showCheckbox => false,
        :showInLegend => true,
        :states => {
          :hover => {
            :brightness => 0.1,
            :enabled => false,
            :lineWidth => 2,
            :marker => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0,
              :radius => 0
            }
          }
        },
        :stickyTracking => true,
        :visible => true
      },
      :series => [{
        :allowPointSelect => false,
        :animation => true,
        :cursor => '',
        :dataLabels => {
          :align => "center",
          :enabled => false,
          :rotation => 0,
          :x => 0,
          :y => -6
        },
        :enableMouseTracking => true,
        :lineWidth => 2,
        :marker => {
          :enabled => true,
          :lineColor => "#FFFFFF",
          :lineWidth => 0,
          :radius => 0,
          :states => {
            :hover => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0
            },
            :select => {
              :enabled => true,
              :lineColor => "#000000",
              :lineWidth => 0
            }
          }
        },
        :pointStart => 0,
        :pointInterval => 1,
        :selected => false,
        :shadow => true,
        :showCheckbox => false,
        :showInLegend => true,
        :states => {
          :hover => {
            :enabled => false,
            :lineWidth => 2,
            :marker => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0,
              :radius => 0
            }
          }
        },
        :stickyTracking => true,
        :visible => true
      }],
      :scatter => {
        :lineWidth => 0,
        :allowPointSelect => false,
        :animation => true,
        :cursor => '',
        :dataLabels => {
          :align => "center",
          :enabled => false,
          :rotation => 0,
          :x => 0,
          :y => -6
        },
        :enableMouseTracking => true,
        :marker => {
          :enabled => true,
          :lineColor => "#FFFFFF",
          :lineWidth => 0,
          :radius => 0,
          :states => {
            :hover => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0
            },
            :select => {
              :enabled => true,
              :lineColor => "#000000",
              :lineWidth => 0
            }
          }
        },
        :pointStart => 0,
        :pointInterval => 1,
        :selected => false,
        :shadow => true,
        :showCheckbox => false,
        :showInLegend => true,
        :states => {
          :hover => {
            :lineWidth => 0,
            :enabled => false,
            :marker => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0,
              :radius => 0,
            }
          }
        },
        :stickyTracking => true,
        :visible => true
      },
      :spline => {
        :allowPointSelect => false,
        :animation => true,
        :cursor => '',
        :dataLabels => {
          :align => "center",
          :enabled => false,
          :rotation => 0,
          :x => 0,
          :y => -6
        },
        :enableMouseTracking => true,
        :lineWidth => 2,
        :marker => {
          :enabled => true,
          :lineColor => "#FFFFFF",
          :lineWidth => 0,
          :radius => 0,
          :states => {
            :hover => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0
            },
            :select => {
              :enabled => true,
              :lineColor => "#000000",
              :lineWidth => 0
            }
          }
        },
        :pointStart => 0,
        :pointInterval => 1,
        :selected => false,
        :shadow => true,
        :showCheckbox => false,
        :showInLegend => true,
        :states => {
          :hover => {
            :enabled => false,
            :lineWidth => 2,
            :marker => {
              :enabled => true,
              :lineColor => "#FFFFFF",
              :lineWidth => 0,
              :radius => 0
            }
          }
        },
        :stickyTracking => true,
        :visible => true
      }
    },
    :point => {
      :marker => {
        :enabled => true,
        :lineColor => "#FFFFFF",
        :lineWidth => 0,
        :radius => 0,
        :states => {
          :hover => {
            :enabled => true,
            :lineColor => "#FFFFFF",
            :lineWidth => 0
          },
          :select => {
            :enabled => true,
            :lineColor => "#000000",
            :lineWidth => 0
          }
        }
      },
      :name => "",
      :sliced => false
    },
    :series => [{
      :data => "",
      :name => "",
      :type => "line",
      :xAxis => 0,
      :yAxis => 0
    }],
    :subtitle => {
      :align => "center",
      :text => "",
      :x => 0,
      :y => 20
    },
    :symbols => [],
    :title => {
      :align => "center",
      :text => "Chart title",
      :x => 0,
      :y => 20
    },
    :tooltip => {
      :backgroundColor => "rgba(255, 255, 255, .85)",
      :borderColor => "auto",
      :borderRadius => 5,
      :borderWidth => 2,
      :enabled => true,
      :shadow => true,
      :snap => 10
    },
    :xAxis => {
      :allowDecimals => true,
      :categories => [],
      :endOnTick => false,
      :gridLineColor => "#C0C0C0",
      :gridLineWidth => 0,
      :labels => {
        :align => "center",
        :enabled => true,
        :rotation => 0,
        :x => 0,
        :y => 0
      },
      :lineColor => "#C0D0E0",
      :lineWidth => 1,
      :maxPadding => 0.01,
      :maxZoom => 1,
      :minorGridLineWidth => 1,
      :minorTickLength => 2,
      :minorTickWidth => 1,
      :minPadding => 0.01,
      :offset => 0,
      :opposite => false,
      :reversed => false,
      :showFirstLabel => true,
      :showLastLabel => false,
      :startOfWeek => 1,
      :startOnTick => false,
      :tickLength => 5,
      :tickmarkPlacement => "between",
      :tickPosition => "outside",
      :tickWidth => 1,
      :title => {
        :align => "middle",
        :margin => 35,
        :rotation => 0
      },
      :type => "linear"
    },
    :yAxis => {
      :endOnTick => true,
      :gridLineWidth => 1,
      :lineWidth => 0,
      :maxPadding => 0.05,
      :minPadding => 0.05,
      :showLastLabel => true,
      :startOnTick => true,
      :tickWidth => 0,
      :allowDecimals => true,
      :categories => [],
      :gridLineColor => "#C0C0C0",
      :labels => {
        :align => "right",
        :x => -8,
        :y => 3,
        :enabled => true,
        :rotation => 0
      },
      :lineColor => "#C0D0E0",
      :maxZoom => 1,
      :minorGridLineWidth => 1,
      :minorTickLength => 2,
      :minorTickWidth => 1,
      :offset => 0,
      :opposite => false,
      :reversed => false,
      :showFirstLabel => true,
      :startOfWeek => 1,
      :tickLength => 5,
      :tickmarkPlacement => "between",
      :tickPosition => "outside",
      :title => {
        :margin => 40,
        :rotation => 270,
        :text => "Y-values",
        :align => "middle"
      },
      :type => "linear"
    },
    # exporting module
    :exporting => {
      :buttons => {
        :exportButton => {
          :symbol => "exportIcon",
          :x => 10,
          :align => "right",
          :borderColor => "#B0B0B0",
          :borderRadius => 3,
          :borderWidth => 1,
          :enabled => true,
          :height => 20,
          :symbolSize => 12,
          :symbolStroke => "#A0A0A0",
          :symbolStrokeWidth => 1,
          :symbolX => 11.5,
          :symbolY => 10.5,
          :verticalAlign => "top",
          :width => 24,
          :y => 10
        },
        :printButton => {
          :symbol => "printIcon",
          :x => -36,
          :align => "right",
          :borderColor => "#B0B0B0",
          :borderRadius => 3,
          :borderWidth => 1,
          :enabled => true,
          :height => 20,
          :symbolSize => 12,
          :symbolStroke => "#A0A0A0",
          :symbolStrokeWidth => 1,
          :symbolX => 11.5,
          :symbolY => 10.5,
          :verticalAlign => "top",
          :width => 24,
          :y => 10
        }
      },
      :enabled => true,
      :filename => "chart",
      :type => "image/png",
      :width => 800
    },
    :navigation => {
      :buttonOptions => {
        :align => "right",
        :borderColor => "#B0B0B0",
        :borderRadius => 3,
        :borderWidth => 1,
        :enabled => true,
        :height => 20,
        :symbolSize => 12,
        :symbolStroke => "#A0A0A0",
        :symbolStrokeWidth => 1,
        :symbolX => 11.5,
        :symbolY => 10.5,
        :verticalAlign => "top",
        :width => 24,
        :y => 10
      }
    }
  }
end
