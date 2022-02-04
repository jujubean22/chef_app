class AddRegionAndCityToChefs < ActiveRecord::Migration[6.1]
  def change
    add_column :chefs, :region, :string
    add_column :chefs, :city, :string
  end
end
