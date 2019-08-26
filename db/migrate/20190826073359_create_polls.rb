class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :Title
      t.string :Description
      t.datetime :Start_Date
      t.datetime :End_Date

      t.timestamps
    end
  end
end
