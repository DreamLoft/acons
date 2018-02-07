class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :number_of_buildings
      t.integer :number_of_wings
      t.integer :number_of_apartments

      t.timestamps
    end
  end
end
