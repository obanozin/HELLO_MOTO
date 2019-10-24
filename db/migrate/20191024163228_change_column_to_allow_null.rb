class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :sex,:integer, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :users, :sex,:integer, null: false
  end
end
