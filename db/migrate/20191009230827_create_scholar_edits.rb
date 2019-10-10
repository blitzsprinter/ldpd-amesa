class CreateScholarEdits < ActiveRecord::Migration[6.0]
  def change
    create_table :scholar_edits do |t|
      t.belongs_to :scholar # instance of Scholar that was edited
      t.string :first_name
      t.string :last_name
      t.belongs_to :region # Region of Study
      t.belongs_to :country # Primary Country of Residence
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
      t.text :warning
      t.string :submitter_email

      t.timestamps
    end

    add_index :scholar_edits, :first_name
    add_index :scholar_edits, :last_name
  end
end
