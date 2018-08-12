class RemoveRoomStatusFromRoom < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :room_status, :string
  end
end
