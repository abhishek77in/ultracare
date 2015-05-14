if Gem.win_platform?
  WickedPdf.config = { exe_path: ['C:', 'Program Files (x86)', 'wkhtmltopdf', 'bin', 'wkhtmltopdf.exe'].join(File::SEPARATOR) }
end
