class CreateSushis < ActiveRecord::Migration[6.1]
  def change
    create_table :sushis do |t|
      t.string :sushiname
      t.text :highlight

      t.timestamps
    end
  end
end
