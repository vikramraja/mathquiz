class Assignment < ActiveRecord::Base
	belongs_to :courses
	has_many :problemsets

end
