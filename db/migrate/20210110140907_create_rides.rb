class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.string :uid, null: false
      t.string :user_id, null: false
      t.string :driver_id, null: false
      t.string :state, null: false

      t.timestamps

      t.index :uid
    end
  end
end
