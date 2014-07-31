class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.datetime :duedate
      t.string :name
      t.integer :creator_id
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
