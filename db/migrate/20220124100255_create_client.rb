class CreateClient < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.references :user_id, null: false, foreign_key: true
      t.string :location
      t.string :contact_number
      t.datetime :suspended_at
      
      t.timestamps
    end
  end
end
