class CreateReview < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :appointment, null: false, foreign_key: true
      t.text :client_comment
      t.integer :chef_rating
      t.integer :client_rating

      t.timestamps
    end
  end
end
