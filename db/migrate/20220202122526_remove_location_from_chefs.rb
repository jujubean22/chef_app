class RemoveLocationFromChefs < ActiveRecord::Migration[6.1]
  def change
    remove_column :chefs, :location, :string
  end
end
