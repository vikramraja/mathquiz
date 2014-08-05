# == Schema Information
#
# Table name: quizzes
#
#  id               :integer          not null, primary key
#  creator_id       :integer
#  challenger_id    :integer
#  status           :string(255)
#  creator_score    :integer
#  challenger_score :integer
#  created_at       :datetime
#  updated_at       :datetime
#  assignment_id    :integer
#

class Quiz < ActiveRecord::Base
	belongs_to :creator, class_name: :user
	belongs_to :challenger, class_name: :user
	belongs_to :assignment
	has_one :topic, :through => :assignment
end
