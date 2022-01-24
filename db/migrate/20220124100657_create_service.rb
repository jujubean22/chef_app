class CreateService < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.references :chef, null: false, foreign_key: true
      t.text :specialty
      t.decimal :service_rate

      t.timestamps
    end
  end
end
