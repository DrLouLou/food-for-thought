class AddDatetimeToDinners < ActiveRecord::Migration[6.0]
  def change
    add_column :dinners, :datetime, :datetime
  end
end
