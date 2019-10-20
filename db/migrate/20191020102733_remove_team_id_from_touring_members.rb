class RemoveTeamIdFromTouringMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :touring_members, :team_id, :integer
  end
end
