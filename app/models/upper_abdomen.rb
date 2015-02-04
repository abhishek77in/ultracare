class UpperAbdomen < ActiveRecord::Base
  include Reportable

  def printable_fields
    %w(liver gall_bladder pancreas spleen right_kidney left_kidney ureter other advise)
  end

end
