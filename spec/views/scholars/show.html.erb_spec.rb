require 'rails_helper'

RSpec.describe "scholars/show", type: :view do
  before(:each) do
    @country = assign(:country, Country.create!(
      :name_eng => "MyString",
      :name_fra => "MyString"))
    @region = assign(:region, Region.create!(
      :name_eng => "MyString",
      :name_fra => "MyString",
      :url_formatted_name => "MyString"))
    @scholar = assign(:scholar, Scholar.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :region => @region,
      :country => @country,
      :title => "Title",
      :affiliation => "Affiliation",
      :email => "Email",
      :mailing_address => "MyText",
      :phone_fax_numbers => "MyText",
      :website => "Website",
      :countries_of_specialization => "MyText",
      :education => "MyText",
      :research_interests => "MyText",
      :teaching_interests => "MyText",
      :publications => "MyText",
      :keywords => "Keywords",
      :optional_message => "MyText",
      :submitter_email => "Submitter Email"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Region Of Study/)
    expect(rendered).to match(/Primary Country Of Residence/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Affiliation/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Keywords/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Submitter Email/)
  end
end
