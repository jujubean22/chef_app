class CreateRequest < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.references :client_id, null: false, foreign_key: true
      t.integer :head_count
      t.string :cuisine
      t.string :courses

      t.timestamps
    end
  end
end
