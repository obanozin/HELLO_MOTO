class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
