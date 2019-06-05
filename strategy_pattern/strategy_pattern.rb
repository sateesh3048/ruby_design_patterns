class ReportGenerator
    attr_accessor :data
    def initialize(data=[], report_instance)
      @report_obj = report_instance
      @data = data
    end

    def show_report
        puts @report_obj.generate_report(self)
    end
end

class HtmlReport
  def generate_report(context)
    "<html><head></head><body>#{context.data.join(',')}</body></html>"
  end
end

class XmlReport
    def generate_report(context)
      "<xml><data>#{context.data.join(',')}</data></xml>"
    end
end

class TextReport
    def generate_report(context)
        "Text report is: #{context.data.join('.')}"
    end
end

class JsonReprot
    def generate_report(context)
        {
            data: context.data
        }
    end
end

# Reports objects creation
marks = [99, 98, 76, 88, 99, 100]
@html_report_obj = HtmlReport.new
@xml_report_obj = XmlReport.new
@text_report_obj = TextReport.new
@json_report_obj = JsonReprot.new

# Generating html report
ReportGenerator.new(marks, @html_report_obj).show_report

# Generating xml report
ReportGenerator.new(marks, @xml_report_obj).show_report

# Generating text report
ReportGenerator.new(marks, @text_report_obj).show_report

# Generating json report
ReportGenerator.new(marks, @json_report_obj).show_report
