# -*- encoding: utf-8 -*-
# stub: wicked_pdf 0.11.0 ruby lib

Gem::Specification.new do |s|
  s.name = "wicked_pdf"
  s.version = "0.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Miles Z. Sterrett"]
  s.date = "2015-04-22"
  s.description = "Wicked PDF uses the shell utility wkhtmltopdf to serve a PDF file to a user from HTML.\nIn other words, rather than dealing with a PDF generation DSL of some sort,\nyou simply write an HTML view as you would normally, and let Wicked take care of the hard stuff.\n"
  s.email = "miles.sterrett@gmail.com"
  s.files = [".gitignore", ".travis.yml", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "gemfiles/2.3.gemfile", "gemfiles/3.0.gemfile", "gemfiles/3.1.gemfile", "gemfiles/3.2.gemfile", "gemfiles/4.0.gemfile", "gemfiles/rails_edge.gemfile", "generators/wicked_pdf/templates/wicked_pdf.rb", "generators/wicked_pdf/wicked_pdf_generator.rb", "init.rb", "lib/generators/wicked_pdf_generator.rb", "lib/wicked_pdf.rb", "lib/wicked_pdf/middleware.rb", "lib/wicked_pdf/pdf_helper.rb", "lib/wicked_pdf/railtie.rb", "lib/wicked_pdf/tempfile.rb", "lib/wicked_pdf/version.rb", "lib/wicked_pdf/wicked_pdf_helper.rb", "test/fixtures/document_with_long_line.html", "test/fixtures/wicked.css", "test/functional/pdf_helper_test.rb", "test/functional/wicked_pdf_helper_assets_test.rb", "test/functional/wicked_pdf_helper_test.rb", "test/test_helper.rb", "test/unit/wicked_pdf_test.rb", "wicked_pdf.gemspec"]
  s.homepage = "https://github.com/mileszs/wicked_pdf"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.3"
  s.summary = "PDF generator (from HTML) gem for Ruby on Rails"
  s.test_files = ["test/fixtures/document_with_long_line.html", "test/fixtures/wicked.css", "test/functional/pdf_helper_test.rb", "test/functional/wicked_pdf_helper_assets_test.rb", "test/functional/wicked_pdf_helper_test.rb", "test/test_helper.rb", "test/unit/wicked_pdf_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
