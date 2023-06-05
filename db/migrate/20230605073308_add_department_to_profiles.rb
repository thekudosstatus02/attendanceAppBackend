class AddDepartmentToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :department, :string
  end
end
