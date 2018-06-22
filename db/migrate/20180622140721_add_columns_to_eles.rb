class AddColumnsToEles < ActiveRecord::Migration[5.2]
  def change
    add_column :eles, :firstname, :string
    add_column :eles, :lastname, :string
    add_column :eles, :photo, :string
    add_column :eles, :description, :string
    add_column :eles, :passion1, :string
    add_column :eles, :passion2, :string
    add_column :eles, :passion3, :string
    add_column :eles, :passion4, :string
    add_column :eles, :ville, :string
    add_column :eles, :departement, :string
  end
end
