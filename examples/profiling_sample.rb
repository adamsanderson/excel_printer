require File.join(File.dirname(__FILE__), '..', 'lib', 'excel_printer')

result = RubyProf.profile do
  greeting = "Hello World!"
  5.times{ greeting.split(/\b/).sort_by{ rand } }
  greeting.upcase
end

printer = ExcelPrinter::FlatExcelPrinter.new(result)
printer.print(__FILE__.sub('.rb', '.xls'))