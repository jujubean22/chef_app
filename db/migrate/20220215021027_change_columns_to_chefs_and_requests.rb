class ChangeColumnsToChefsAndRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :schedule_date, :datetime
    add_column :requests, :schedule_time, :datetime
    add_column :appointments, :appointment_time, :datetime
    add_column :chefs, :rating, :integer
  end
end
