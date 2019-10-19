class AddUserRefAndTeamRefToMessageTeam < ActiveRecord::Migration[5.2]
  def change
    add_reference :message_teams, :user, foreign_key: true
    add_reference :message_teams, :team, foreign_key: true
    change_column_null :message_teams, :user_id, false
    change_column_null :message_teams, :team_id, false
  end
end
