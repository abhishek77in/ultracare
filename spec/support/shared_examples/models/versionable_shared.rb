require 'rails_helper'

shared_examples "versionable" do |model|

  it 'enables paper trail' do
    is_expected.to be_versioned
  end

  it 'tracks verions', :versioning => true do
    object = FactoryGirl.create(model.name.underscore)
    object.update_attributes!(updated_at: 4.days.from_now)

    expect(object.versions.count).to eq 2
  end

end
