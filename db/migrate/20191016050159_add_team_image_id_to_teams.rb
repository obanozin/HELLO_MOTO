class AddTeamImageIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :team_image_id, :string
  end
end
