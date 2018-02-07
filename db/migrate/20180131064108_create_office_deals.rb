class CreateOfficeDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :office_deals do |t|
      t.references :office_customer, foreign_key: true
      t.references :apartment, foreign_key: true
      t.integer :base_price
      t.integer :stamp_duty
      t.integer :registration_charges
      t.integer :other_charges
      t.integer :maintenance_charges
      t.integer :parking_charges
      t.integer :developement_charges
      t.integer :club_membership_charges
      t.integer :furniture_charges

      t.timestamps
    end
  end
end
