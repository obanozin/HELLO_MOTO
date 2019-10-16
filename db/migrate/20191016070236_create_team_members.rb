class CreateTeamMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_members do |t|

    	t.integer :team_id
    	t.integer :user_id
    	t.integer :is_team, default: 0
    	t.string :request_comment

      t.timestamps
    end
  end
end
