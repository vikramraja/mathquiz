# == Schema Information
#
# Table name: quizzes
#
#  id                :integer          not null, primary key
#  creator_id        :integer
#  challenger_id     :integer
#  status            :string(255)
#  creator_score     :integer
#  challenger_score  :integer
#  created_at        :datetime
#  updated_at        :datetime
#  assignment_id     :integer
#  challenger_status :string(255)
#

require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
