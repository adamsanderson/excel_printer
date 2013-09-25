require 'ruby-prof'
require 'axlsx'
require 'excel_printer'

describe "ExcelPrinter" do

  after(:all) do
   `rm tmp/*`
   `rm report.xlsx`
  end

  describe "print" do

    it "should create an xlsx file" do

      result = RubyProf.profile do
        k = 1 - 2
      end

      printer = ExcelPrinter::FlatExcelPrinter.new result
      printer.print "tmp/test_report.xlsx"
      File.exists?("tmp/test_report.xlsx").should == true
    end

    it "shpuld default to report.xlsx if no filename is provided" do

      result = RubyProf.profile do
        k = 1 - 2
      end

      printer = ExcelPrinter::FlatExcelPrinter.new result
      printer.print
      File.exists?("report.xlsx").should == true 
    end
  end
end

