FactoryGirl.define do

  factory :setting do
    print_settings "header"=>"YOUR DIAGNOSTIC CENTRE",
                   "signature"=>"Signature",
                   "footer"=>"No valid for medicolegal purpose",
                   "header_margin"=>"65",
                   "footer_margin"=>"20"
  end

end
