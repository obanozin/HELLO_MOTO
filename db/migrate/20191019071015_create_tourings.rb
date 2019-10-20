class CreateTourings < ActiveRecord::Migration[5.2]
  def change
    create_table :tourings do |t|
      t.integer :user_id
      t.integer :team_id
      t.string :destination
      t.string :touring_date
      t.string :touring_image_id
      t.string :touring_detail
      t.string :touring_name

      t.timestamps
    end
  end
end
