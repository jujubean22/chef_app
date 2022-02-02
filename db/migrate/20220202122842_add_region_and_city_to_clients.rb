class AddRegionAndCityToClients < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :region, :string
    add_column :clients, :city, :string
  end
end
