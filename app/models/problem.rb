# == Schema Information
#
# Table name: problems
#
#  id         :integer          not null, primary key
#  item1      :integer
#  item2      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Problem < ActiveRecord::Base
end
