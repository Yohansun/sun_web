require 'test_helper'

class Manage::HomeDialogCelebritiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get images" do
    get :images
    assert_response :success
  end

end
