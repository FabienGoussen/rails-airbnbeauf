class AddProfilePictureToProduct < ActiveRecord::Migration
  def change
    add_column :products, :profile_picture, :string
  end
end
