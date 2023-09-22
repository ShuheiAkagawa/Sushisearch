class AddImageToSushis < ActiveRecord::Migration[6.1]
  def change
    add_column :sushis, :image, :string
  end
end
