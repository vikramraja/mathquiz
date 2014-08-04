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

require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
