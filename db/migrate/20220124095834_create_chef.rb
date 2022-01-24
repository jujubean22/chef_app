class CreateChef < ActiveRecord::Migration[6.1]
  def change
    create_table :chefs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.string :contact_number
      t.datetime :suspended_at
      t.text :bio

      t.timestamps
    end
  end
end
