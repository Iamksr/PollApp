class CreateMyoptions < ActiveRecord::Migration[5.0]
  def change
    create_table :myoptions do |t|
      t.integer :poll_id
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
