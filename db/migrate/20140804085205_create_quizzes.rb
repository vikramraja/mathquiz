class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :creator_id
      t.integer :challenger_id
      t.string :status
      t.integer :creator_score
      t.integer :challenger_score

      t.timestamps
    end
  end
end
