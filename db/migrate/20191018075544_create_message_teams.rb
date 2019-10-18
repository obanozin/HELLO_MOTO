class CreateMessageTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :message_teams do |t|
      t.text :content

      t.timestamps
    end
  end
end
