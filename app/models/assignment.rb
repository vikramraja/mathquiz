# == Schema Information
#
# Table name: assignments
#
#  id                :integer          not null, primary key
#  duedate           :datetime
#  name              :string(255)
#  creator_id        :integer
#  description       :string(255)
#  status            :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  problemtype       :string(255)
#  problemnumber     :integer
#  course_id         :integer
#  problemdifficulty :string(255)
#

class Assignment < ActiveRecord::Base

	belongs_to :course
	has_many :quizzes
	has_one :topic

end
