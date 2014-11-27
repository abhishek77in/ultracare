if (/darwin/ =~ RUBY_PLATFORM) || (/linux/ =~ RUBY_PLATFORM)
  WickedPdf.config = { :exe_path => '/usr/local/bin/wkhtmltopdf' }
end
