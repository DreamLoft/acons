class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :apartment_name
      t.string :carpet_area
      t.string :build_up
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
