class Updateproblems < ActiveRecord::Migration
  def change
  	change_table :problems do |f|
  	f.integer :quiz_id 

  end
end

end
