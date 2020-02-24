class CreateDinners < ActiveRecord::Migration[6.0]
  def change
    create_table :dinners do |t|
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.string :cuisine
      t.integer :capacity
      t.integer :price
      t.string :title
      t.date :date

      t.timestamps
    end
  end
end
