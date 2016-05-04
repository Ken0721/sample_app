require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	def setup
		@user = users(:michael)
		@other_user = users(:archer)
	end

  test "should get new" do
    get :new
    assert_response :success
    #assert_select ":title", "Sign up | Ruby on Rails Tutorial Sample App" 
  end
	
	test "should redirect index when not logged in" do
		get :index
		assert_redirected_to login_url
	end

	test "should redirect following when not logged in" do
		get :following, id: @user
		assert_redirected_to login_url
	end

	test "should redirect followers when not logged in" do
		get :followers, id: @user
		assert_redirected_to login_url
	end
end

