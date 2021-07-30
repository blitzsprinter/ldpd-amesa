require 'rails_helper'

RSpec.describe "scholars/new", type: :view do
  before(:each) do
    @country = assign(:country, Country.create!(
      :name_eng => "MyString",
      :name_fra => "MyString"))
    @region = assign(:region, Region.create!(
      :name_eng => "MyString",
      :name_fra => "MyString",
      :url_formatted_name => "MyString"))
    assign(:scholar, Scholar.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :region => @region,
      :country => @country,
      :title => "MyString",
      :affiliation => "MyString",
      :email => "MyString",
      :mailing_address => "MyText",
      :phone_fax_numbers => "MyText",
      :website => "MyString",
      :countries_of_specialization => "MyText",
      :education => "MyText",
      :research_interests => "MyText",
      :teaching_interests => "MyText",
      :publications => "MyText",
      :keywords => "MyString",
      :optional_message => "MyText",
      :submitter_email => "MyString"
    ))
  end

  it "renders new scholar form" do
    render

    assert_select "form[action=?][method=?]", scholars_path, "post" do

      assert_select "input[name=?]", "scholar[first_name]"

      assert_select "input[name=?]", "scholar[last_name]"

      assert_select "input[name=?]", "scholar[title]"

      assert_select "input[name=?]", "scholar[email]"

      assert_select "textarea[name=?]", "scholar[mailing_address]"

      assert_select "textarea[name=?]", "scholar[phone_fax_numbers]"

      assert_select "input[name=?]", "scholar[website]"

      assert_select "textarea[name=?]", "scholar[countries_of_specialization]"

      assert_select "textarea[name=?]", "scholar[education]"

      assert_select "textarea[name=?]", "scholar[research_interests]"

      assert_select "textarea[name=?]", "scholar[teaching_interests]"

      assert_select "textarea[name=?]", "scholar[publications]"

      assert_select "input[name=?]", "scholar[keywords]"

      assert_select "textarea[name=?]", "scholar[optional_message]"

      assert_select "input[name=?]", "scholar[submitter_email]"
    end
  end
end
