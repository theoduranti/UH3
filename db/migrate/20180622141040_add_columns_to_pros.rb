class AddColumnsToPros < ActiveRecord::Migration[5.2]
  def change
    add_column :pros, :firstname, :string
    add_column :pros, :lastname, :string
    add_column :pros, :photo, :string
    add_column :pros, :description, :string
    add_column :pros, :passion1, :string
    add_column :pros, :passion2, :string
    add_column :pros, :passion3, :string
    add_column :pros, :passion4, :string
    add_column :pros, :ville, :string
    add_column :pros, :departement, :string
  end
end
