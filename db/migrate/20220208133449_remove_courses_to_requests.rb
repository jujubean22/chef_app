class RemoveCoursesToRequests < ActiveRecord::Migration[6.1]
  def change
    remove_column :requests, :courses, :string
    add_column :requests, :notes_to_chef, :text
    add_reference :requests, :chef, foreign_key: true
  end
end
