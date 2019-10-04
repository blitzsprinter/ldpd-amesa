require 'rails_helper'

RSpec.describe "scholars/index", type: :view do
  before(:each) do
    assign(:scholars, [
      Scholar.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :region_of_study => "Region Of Study",
        :primary_country_of_residence => "Primary Country Of Residence",
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
      ),
      Scholar.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :region_of_study => "Region Of Study",
        :primary_country_of_residence => "Primary Country Of Residence",
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
      )
    ])
  end

  it "renders a list of scholars" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Region Of Study".to_s, :count => 2
    assert_select "tr>td", :text => "Primary Country Of Residence".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Affiliation".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Submitter Email".to_s, :count => 2
  end
end
