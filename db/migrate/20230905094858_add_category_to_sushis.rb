class AddCategoryToSushis < ActiveRecord::Migration[6.1]
  def change
    add_column :sushis, :category, :string
  end
end
