# Generates flat profile reports as XLS documents. 
# To use the flat excel printer:
#
#   result = RubyProf.profile do
#     [code to profile]
#   end
#
#   printer = ExcelPrinter::FlatExcelPrinter.new(result)
#   printer.print('report.xls')
#
module ExcelPrinter
  class FlatExcelPrinter < RubyProf::AbstractPrinter
    # Print a flat profile report to the provided output.
    # 
    # output - Any file-like oject. 
    # The default value is excel_flat_printer.xls
    # 
    # options - Hash of print options.  See #setup_options 
    #           for more information.
    #
    def print(output = self.to_s, options = {})
      setup_options(options)
    
      package = Axlsx::Package.new
      workbook = package.workbook
      print_threads(workbook)
    
      # Spreadsheet::Workbook#write seems to need a file path,
      # or possibly a r/w IO object, so for now just get the path, write there.
      path = output.respond_to?(:path) ? output.path : output.to_s
      package.serialize path 
    end      
  
    # The ruby-prof performance tests seem to use this as the default
    # name for the reports.
    def to_s
      'report.xlsx'
    end
  
    def print_threads(workbook)
      @result.threads.each_with_index do |thread, index|
        sheet = workbook.add_worksheet(:name =>"Thread #{index}")
        methods = thread.methods.nil? ? [] : thread.methods
        print_methods(workbook, sheet, thread, methods)
      end
    end
  
    def print_methods(workbook, sheet, thread, methods)
      # Get total time
      sum = 0
      toplevel = methods.sort.last
      total_time = toplevel.total_time
      if total_time == 0
        total_time = 0.01
      end

      bold_cell = nil
      workbook.styles do |s|
        bold_cell = s.add_style :b => true
      end
      
      sheet.add_row [ "Thread Total Time" ], :style => [bold_cell]
      sheet.add_row [ thread.total_time ]

      sheet.add_row []
      
      sheet.add_row ["%self", "total", "self" , "wait" , "child", "calls", "name"], :style => [bold_cell]
      
      methods.each do |method|
        #self_percent = (method.self_time / total_time) * 100
            
        sum += method.self_time
        sheet.add_row [
                       method.self_time / total_time * 100, # %self
                       method.total_time,                   # total
                       method.self_time,                    # self
                       method.wait_time,                    # wait
                       method.children_time,                # children
                       method.called,                       # calls
                       method_name(method)                  # name
                      ]
      end
    end
  end
end
