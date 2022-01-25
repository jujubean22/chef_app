class AddColumnToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :payment_released_at, :datetime
  end
end
