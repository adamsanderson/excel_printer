# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{excel_printer}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Sanderson"]
  s.date = %q{2009-06-02}
  s.description = %q{      RubyProf report printer that generates Excel XLS files.
}
  s.email = %q{netghost@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
    "Rakefile",
    "VERSION.yml",
    "examples/profiling_sample.rb",
    "examples/profiling_sample.xls",
    "lib/excel_printer.rb",
    "lib/excel_printer/flat_excel_printer.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/adamsanderson/excel_printer}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{RubyProf report printer that generates Excel XLS files}
  s.test_files = [
    "examples/profiling_sample.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-prof>, ["~> 0.7"])
      s.add_runtime_dependency(%q<spreadsheet>, ["~> 0.6.3"])
    else
      s.add_dependency(%q<ruby-prof>, ["~> 0.7"])
      s.add_dependency(%q<spreadsheet>, ["~> 0.6.3"])
    end
  else
    s.add_dependency(%q<ruby-prof>, ["~> 0.7"])
    s.add_dependency(%q<spreadsheet>, ["~> 0.6.3"])
  end
end
