class AddDescriptionToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :description, :text
  end
end
