class AddIndexToTouringMember < ActiveRecord::Migration[5.2]
  def change
  	add_index :touring_members, [:user_id, :touring_id], :name => 'unique_touring_index', :unique => true
  end
end
