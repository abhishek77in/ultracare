if Gem.win_platform?
  WickedPdf.config = { exe_path: ['C:', 'Program Files', 'wkhtmltopdf', 'wkhtmltopdf.exe'].join(File::SEPARATOR) }
end
