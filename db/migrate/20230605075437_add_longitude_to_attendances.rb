class AddLongitudeToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :longitude, :string
  end
end
