class RemoveLocationFromClients < ActiveRecord::Migration[6.1]
  def change
    remove_column :clients, :location, :string
  end
end
