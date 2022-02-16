require 'rails_helper'

RSpec.describe Gallery, type: :model do
  context "with a valid file" do
    it "is attached" do
        file_path = Rails.root.join('app', 'assets', 'images', 'avatar-1.jpg')
        image = ActiveStorage::Blob.create_and_upload!(
        io:File.open(file_path),
        filename: 'avatar-1.jpg',
        content_type: 'image/jpg'
        )
        gallery = Gallery.new(image: image)
    end
  end
end
