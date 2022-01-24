class CreateGallery < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries do |t|
      t.references :chef, null: false, foreign_key: true
      t.string :image
      
      t.timestamps
    end
  end
end
