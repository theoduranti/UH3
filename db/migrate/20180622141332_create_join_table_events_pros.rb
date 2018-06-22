class CreateJoinTableEventsPros < ActiveRecord::Migration[5.2]
  def change
    create_join_table :events, :pros do |t|
      t.index [:event_id, :pro_id]
      t.index [:pro_id, :event_id]
    end
  end
end
