class AddAnswerIdToMyoptions < ActiveRecord::Migration[5.0]
  def change
    add_column :myoptions, :answer_id, :integer
  end
end
