class CreateMotoInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :moto_infos do |t|

      t.string :maker_name
      t.string :moto_name
      t.string :volume
      t.boolean :is_own,null: false, default: false

      t.timestamps
    end
  end
end
