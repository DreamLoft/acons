class AddQuantityToRoomService < ActiveRecord::Migration[5.1]
  def change
    add_column :room_services, :quantity, :integer
  end
end
