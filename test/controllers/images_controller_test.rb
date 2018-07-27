require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get description" do
    get :description
    assert_response :success
  end

  test "should get hotels" do
    get :hotels
    assert_response :success
  end

end
