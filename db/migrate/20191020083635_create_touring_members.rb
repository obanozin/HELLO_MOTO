class CreateTouringMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :touring_members do |t|
      t.bigint :user_id
      t.bigint :team_id
      t.timestamps
    end
  end
end
