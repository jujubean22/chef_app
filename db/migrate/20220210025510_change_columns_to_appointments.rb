class ChangeColumnsToAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_reference :appointments, :service, foreign_key: true
    add_reference :appointments, :chef, foreign_key: true
  end
end
