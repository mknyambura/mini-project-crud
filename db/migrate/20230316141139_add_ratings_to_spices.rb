class AddRatingsToSpices < ActiveRecord::Migration[6.1]
  def change
    add_column :spices, :ratings, :float, null: false, default: 0
  end
end
