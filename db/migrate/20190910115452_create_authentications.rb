class CreateAuthentications < ActiveRecord::Migration[5.0]
  def change
    create_table :authentications do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end
end