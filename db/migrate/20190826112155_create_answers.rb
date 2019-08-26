class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :poll_id
      t.string :Title

      t.timestamps
    end
  end
end
