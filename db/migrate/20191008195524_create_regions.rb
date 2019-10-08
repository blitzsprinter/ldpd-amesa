class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :name_eng
      t.string :name_fra
      t.string :url_formatted_name
    end
  end
end
