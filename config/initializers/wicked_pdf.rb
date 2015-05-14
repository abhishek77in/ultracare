if Gem.win_platform?
  WickedPdf.config = { exe_path: ['C:', 'wkhtmltopdf', 'bin', 'wkhtmltopdf.exe'].join(File::SEPARATOR) }
end
