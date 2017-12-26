class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.text :coupon_code
      t.text :coupon_status

      t.timestamps
    end
  end
end
