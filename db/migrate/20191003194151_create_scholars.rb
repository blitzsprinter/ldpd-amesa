class CreateScholars < ActiveRecord::Migration[6.0]
  def change
    create_table :scholars do |t|
      t.string :first_name
      t.string :last_name
      t.string :region_of_study
      t.string :primary_country_of_residence
      t.string :title
      t.string :affiliation
      t.string :email
      t.text :mailing_address
      t.text :phone_fax_numbers
      t.string :website
      t.text :countries_of_specialization
      t.text :education
      t.text :research_interests
      t.text :teaching_interests
      t.text :publications
      t.string :keywords
      t.text :optional_message
      t.string :submitter_email

      t.timestamps
    end
  end
end
