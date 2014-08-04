class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :operand
      t.string :difficulty

      t.timestamps
    end
  end
end
