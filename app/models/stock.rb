class Stock < ApplicationRecord
  belongs_to :stock_item
  after_save do |stock|
#    puts  stock.stock_item_id
     @item=StockItem.find(stock.stock_item_id)
     @item.quantity= @item.quantity + stock.quantity
     @item.save
  end
end
