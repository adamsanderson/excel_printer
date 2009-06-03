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
    
      workbook = Spreadsheet::Workbook.new
      print_threads(workbook)
    
      # Spreadsheet::Workbook#write seems to need a file path,
      # or possibly a r/w IO object, so for now just get the path, write there.
      path = output.respond_to?(:path) ? output.path : output.to_s
      workbook.write path
    end      
  
    # The ruby-prof performance tests seem to use this as the default
    # name for the reports.
    def to_s
      'excel_flat_printer.xls'
    end
  
    private 
  
    def print_threads(workbook)
      @result.threads.each do |thread_id, methods|
        sheet = workbook.create_worksheet(:name=>"Thread #{thread_id}")
        print_methods(sheet, thread_id, methods)
      end
    end
  
    def print_methods(sheet, thread_id, methods)
      # Get total time
      toplevel = methods.sort.last
      total_time = toplevel.total_time
      if total_time == 0
        total_time = 0.01
      end
    
      header = sheet.row(0)
      header.push "%self", "total", "self" , "wait" , "child", "calls", "name"

      bold = Spreadsheet::Format.new(:weight=>:bold)
      header.each_with_index{|cell, i| header.set_format(i, bold) }
    
      sum = 0    
      row_index = 1
      methods.each do |method|
        self_percent = (method.self_time / total_time) * 100
            
        sum += method.self_time
        #self_time_called = method.called > 0 ? method.self_time/method.called : 0
        #total_time_called = method.called > 0? method.total_time/method.called : 0
        sheet.row(row_index).push(
          method.self_time / total_time * 100, # %self
          method.total_time,                   # total
          method.self_time,                    # self
          method.wait_time,                    # wait
          method.children_time,                # children
          method.called,                       # calls
          method_name(method)                  # name
        )
        row_index += 1
      end
    end
  end
end