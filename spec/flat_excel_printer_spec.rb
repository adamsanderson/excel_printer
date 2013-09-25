require 'ruby-prof'
require 'axlsx'
require 'excel_printer'

describe "ExcelPrinter" do

  after(:each) do
    `rm tmp/*`
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
  end
end
