class AddDistancetToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :distance, :float
  end
end
