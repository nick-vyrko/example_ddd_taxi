class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.string :user_id, null: false
      t.string :state, default: 'ignition', null: false

      t.timestamps

      t.index :user_id
    end
  end
end
