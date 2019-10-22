class AddMeetToTourings < ActiveRecord::Migration[5.2]
  def change
    add_column :tourings, :meet, :string
  end
end
