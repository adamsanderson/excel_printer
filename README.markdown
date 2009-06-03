ExcelPrinter
=============

This is a little RubyProf report printer for generating simple flat profiling 
reports in Excel's XLS file format.

Installing
----------
ExcelPrinter is distributed as a rubygem:
  
    gem install excel_printer

Usage
-----
This is just a standard report printer, you can drop it in anywhere that you would
use a report printer in ruby-prof:

    require 'rubygems'
    require 'ruby-prof'
    require 'excel_printer'

    result = RubyProf.profile do
      # Your code here
    end

    printer = ExcelPrinter::FlatExcelPrinter.new(result)
    printer.print('report.xls')

See the examples for more information.

Why?
----
I got tired of having to remember `sort -n -r -k 2`.
Theoretically you could then filter, and such in Excel, OpenOffice, etc.

Anyways, it's kind of neat.

Adam Sanderson, netghost@gmail.com