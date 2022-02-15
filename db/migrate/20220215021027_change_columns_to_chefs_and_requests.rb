class ChangeColumnsToChefsAndRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :schedule, :datetime
    add_column :chefs, :rating, :integer
  end
end
