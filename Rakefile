require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "excel_printer"
    s.summary = "RubyProf report printer that generates Excel XLS files"
    s.description = <<-DESC
      RubyProf report printer that generates Excel XLS files.
    DESC
    s.email = "netghost@gmail.com"
    s.homepage = "http://github.com/adamsanderson/excel_printer"
    s.authors = ["Adam Sanderson"]
    s.files = FileList["[A-Z]*", "{bin,lib,test}/**/*"]
    
    # Runtime dependencies
    s.add_dependency 'ruby-prof', '~> 0.7'
    s.add_dependency 'spreadsheet', '~> 0.6.3'
    
    # Testing -- none yet
    #s.test_files = FileList["test/**/*_test.rb"]
    #s.add_development_dependency 'mocha', '~> 0.9.5'
  end

rescue LoadError
  puts "Jeweler not available. Install it for jeweler-related tasks with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test