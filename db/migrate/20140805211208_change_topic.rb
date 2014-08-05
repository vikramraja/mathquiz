class ChangeTopic < ActiveRecord::Migration
  def change
  	add_column :topics, :assignment_id, :integer
  	add_index :topics, :assignment_id
  end
end
