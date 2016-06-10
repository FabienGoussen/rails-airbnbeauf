class FixColumnName < ActiveRecord::Migration
  def change

    rename_column :bookings, :validate, :status

  end
end
