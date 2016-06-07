class AddMessageToUser < ActiveRecord::Migration
  def change
    add_column :users, :message, :text
  end
end
