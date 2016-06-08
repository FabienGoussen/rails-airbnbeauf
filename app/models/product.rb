class Product < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :users, through: :bookings
  has_many :bookings

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
