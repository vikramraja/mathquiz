class Quiz < ActiveRecord::Base
	belongs_to :creator, class_name: :user
	belongs_to :challenger, class_name: :user
	has_one :problemsets
end
