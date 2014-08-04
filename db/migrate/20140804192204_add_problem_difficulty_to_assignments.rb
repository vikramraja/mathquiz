class AddProblemDifficultyToAssignments < ActiveRecord::Migration
  def change
  	change_table :assignments do |f|
  	f.string :problemdifficulty
  	end

  end
end
