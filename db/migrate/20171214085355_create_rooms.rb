class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_type
      t.string :room_status

      t.timestamps
    end
  end
end
