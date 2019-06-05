# Strategy Pattern
Strategy is software design pattern which enables an 
 alogorithm behavior to be selected at run time.  
 Using strategy pattern

    1)We can define a family of algorithms,
    2)encapsulates each algorithm.
    3)choose the algoritham at run time.


## Advantages:

1. A family of algorithms can be defined as a class hierarchy and can be used interchangeably to alter application behavior without changing its architecture.
2. By encapsulating the algorithm separately, new algorithms complying with the same interface can be easily introduced.
3. The application can switch strategies at run-time.
4. Strategy enables the clients to choose the required algorithm, without using a “switch” statement or a series of “if-else” statements.
5. Data structures used for implementing the algorithm are completely encapsulated in Strategy classes. Therefore, the implementation of an algorithm can be changed without affecting the Context class.

## Disadvantages:

The application must be aware of all the strategies to select the right one for the right situation.
Context and the Strategy classes normally communicate through the interface specified by the abstract Strategy base class. Strategy base class must expose interface for all the required behaviours, which some concrete Strategy classes might not implement.
In most cases, the application configures the Context with the required Strategy object. Therefore, the application needs to create and maintain two objects in place of one.

Example :-

```ruby
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

```
