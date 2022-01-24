class CreateAppointment < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :service, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true
      t.datetime :schedule
      t.decimal :total_charge
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end