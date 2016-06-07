class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :rating
      t.string :validate
      t.text :comment
      t.integer :begin_date
      t.integer :end_date
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
