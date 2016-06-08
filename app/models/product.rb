class Product < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.city_search(search)
    where("city LIKE ?", "%#{search}%")
  end

  def self.begin_date_search(search)
    where("begin_date = ?", "#{search}")
  end

  def self.end_date_search(search)
    where("end_date = ?", "#{search}")
  end
end
