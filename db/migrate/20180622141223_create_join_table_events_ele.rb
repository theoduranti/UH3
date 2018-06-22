class CreateJoinTableEventsEle < ActiveRecord::Migration[5.2]
  def change
    create_join_table :events, :eles do |t|
      t.index [:event_id, :ele_id]
      t.index [:ele_id, :event_id]
    end
  end
end
