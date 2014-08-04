class Quiz < ActiveRecord::Base
	belongs_to :creator, class_name: :user
	belongs_to :challenger, class_name: :user
	belongs_to :assignment
	has_one :topic, :through => :assignment
end
