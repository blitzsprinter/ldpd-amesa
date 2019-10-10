class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name_eng
      t.string :name_fra

      t.timestamps
    end
  end
end
