class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def self.book
    SELECT product_id FROM products R
    WHERE RoomType = 'Single' AND NOT EXISTS
    (SELECT * FROM BOOKINGS
     WHERE product_id = R.product_id
        AND begin_date >= '//'
        AND end_date <= '//'
    )
    where("begin_date <= ?", "#{search}")
  end
end
