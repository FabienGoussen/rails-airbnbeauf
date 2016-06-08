class Product < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  belongs_to :user

  def self.search(search)
    where("city LIKE ?", "%#{search}%")
  end
end
