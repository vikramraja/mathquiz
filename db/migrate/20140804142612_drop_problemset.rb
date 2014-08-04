class DropProblemset < ActiveRecord::Migration
  def change
    drop_table :problemsets
  end
end
