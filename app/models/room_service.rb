class RoomService < ApplicationRecord
  belongs_to :stock_item
  belongs_to :booking
  belongs_to :room
  after_save do |room_service|
    @stock_items = StockItem.find(room_service.stock_item_id)
    @stock_items.quantity= @stock_items.quantity - room_service.quantity
    @stock_items.save
  end
end
