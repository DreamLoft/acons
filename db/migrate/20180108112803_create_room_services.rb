class CreateRoomServices < ActiveRecord::Migration[5.1]
  def change
    create_table :room_services do |t|
      t.references :stock_item, foreign_key: true
      t.references :booking, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
