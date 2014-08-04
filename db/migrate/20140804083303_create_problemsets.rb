class CreateProblemsets < ActiveRecord::Migration
  def change
    create_table :problemsets do |t|
      t.string :name
      t.string :operand

      t.timestamps
    end
  end
end
