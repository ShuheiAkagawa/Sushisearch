class AddUserIdToSushis < ActiveRecord::Migration[6.1]
  def change
    add_column :sushis, :user_id, :integer
  end
end
