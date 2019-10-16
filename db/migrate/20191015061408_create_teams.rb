class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :user_id
      t.string :region
      t.string :team_introduction
      t.string :team_name

      t.timestamps
    end
  end
end
