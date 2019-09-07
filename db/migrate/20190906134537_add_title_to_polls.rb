class AddTitleToPolls < ActiveRecord::Migration[5.0]
  def change
  	remove_column :polls, :Title, :string
  	remove_column :polls, :Description, :string
  	remove_column :polls, :Start_Date, :datetime
  	remove_column :polls, :End_Date, :datetime
  	add_column :polls, :title, :string
  	add_column :polls, :description, :text
  	add_column :polls, :start_date, :datetime
  	add_column :polls, :end_date, :datetime

  end
end
