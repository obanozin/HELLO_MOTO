class AddDetailsToTeams < ActiveRecord::Migration[5.2]
  def change
    # add_column :teams, :team_image_id, :string
    add_column :teams, :region_team, :string
    add_column :teams, :age_range, :string
  end
end
