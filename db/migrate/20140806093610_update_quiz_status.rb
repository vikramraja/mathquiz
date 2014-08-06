class UpdateQuizStatus < ActiveRecord::Migration
  def change
  	change_table :quizzes do |a|
  		a.string :challenger_status
  end
end 
end
