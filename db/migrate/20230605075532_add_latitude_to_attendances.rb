class AddLatitudeToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :latitude, :string
  end
end
