class CreateReview < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :appointment_id, null: false, foreign_key: true
      t.text :client_comment
      t.decimal :chef_rating
      t.decimal :client_rating

      t.timestamps
    end
  end
end
