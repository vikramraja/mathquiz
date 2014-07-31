require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  test "should get addstudents" do
    get :addstudents
    assert_response :success
  end

end
