class AddTouringIdToTouringMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :touring_members, :touring, foreign_key: true, type: :integer
  end
end
