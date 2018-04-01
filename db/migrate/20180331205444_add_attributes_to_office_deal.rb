class AddAttributesToOfficeDeal < ActiveRecord::Migration[5.1]
  def change
    add_column :office_deals, :total_price, :decimal
  end
end
