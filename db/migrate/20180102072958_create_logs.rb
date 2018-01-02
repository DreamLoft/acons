class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.references :guest, foreign_key: true
      t.datetime :check_in_time
      t.datetime :check_out_time
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
