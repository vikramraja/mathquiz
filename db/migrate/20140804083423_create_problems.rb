class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :item1
      t.integer :item2

      t.timestamps
    end
  end
end
