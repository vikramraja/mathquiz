class Assignments < ActiveRecord::Migration
  def change

 	change_table :assignments do |t|
      t.string :problemtype
      t.integer :problemnumber
  end

  end
end
