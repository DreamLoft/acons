class AddPriceToRoomService < ActiveRecord::Migration[5.1]
  def change
    add_column :room_services, :price, :integer
  end
end
