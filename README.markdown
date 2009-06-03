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

Fork Me!
--------

This was just a little exploration of mine, it could be the starting point for 
something really neat that *you* might do.  Possible ideas include:

* Adding formulas that show min/max of stats and maybe the standard deviation
* Better formatting, perhaps fade the insignificant resusults, or put the outliers in red
* Use FlatExcelPrinter as a starting point and make a more details report, like the ruby-prof graph reports

Adam Sanderson, netghost@gmail.com