class CreateOfficeCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :office_customers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.date :date_of_enquiry
      t.string :from_where
      t.string :looking_for
      t.integer :budget
      t.string :broker
      t.string :status
      t.text :comments
      t.string :source

      t.timestamps
    end
  end
end
