class UpdateQuiz < ActiveRecord::Migration
  def change
  	change_table :quizzes do |f|
  		f.integer :assignment_id
  	end

  end
end
