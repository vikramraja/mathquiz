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

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
