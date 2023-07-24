class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :bike_type
      t.decimal :price

      t.timestamps
    end
  end
end
