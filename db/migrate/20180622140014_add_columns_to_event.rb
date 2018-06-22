class AddColumnsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :name, :string
    add_column :events, :description, :text
    add_column :events, :discipline, :string
    add_column :events, :date, :string
    add_column :events, :ville, :string
    add_column :events, :departement, :string
    add_column :events, :prix, :decimal

    add_column :events, :creator_id, :integer
    add_column :events, :professor_id, :integer
    add_column :events, :etat, :string
    add_column :events, :naturecreateur, :string
    add_column :events, :professeur, :string

    add_column :events, :asubscribe, :integer, array:true, default: []
    add_column :events, :apayer, :integer, array:true, default: []
  end
end
