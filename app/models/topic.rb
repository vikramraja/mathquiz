# == Schema Information
#
# Table name: topics
#
#  id            :integer          not null, primary key
#  operand       :string(255)
#  difficulty    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  assignment_id :integer
#

class Topic < ActiveRecord::Base
	belongs_to :assignment
end

