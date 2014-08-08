# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Course < ActiveRecord::Base
	has_many :enrollments, :dependent => :destroy
	has_many :users, :through => :enrollments, :dependent => :destroy
	has_many :assignments, :dependent => :destroy
end
