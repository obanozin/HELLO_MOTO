class CreateMessageTourings < ActiveRecord::Migration[5.2]
  def change
    create_table :message_tourings do |t|
      t.text :content

      t.timestamps
    end
  end
end
