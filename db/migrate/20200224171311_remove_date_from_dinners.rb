class RemoveDateFromDinners < ActiveRecord::Migration[6.0]
  def change

    remove_column :dinners, :date, :date
  end
end
