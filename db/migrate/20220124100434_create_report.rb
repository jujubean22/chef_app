class CreateReport < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :chef, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
