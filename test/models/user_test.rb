require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

	test "name should be present" do
		@user.name = " "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email=" "
		assert_not @user.valid?
	end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
	
	test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

	test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

#	test "associated projects must be destroyed" do
#    @user.save
#    @user.projects.create!(name: "food")
#    assert_difference 'Project.count', -1 do
#      @user.destroy
#    end
#	end
	test "should follow and unfollow a user" do
		michael = users(:michael)
		archer = users(:archer)
		assert_not michael.following?(archer)
		michael.follow(archer)
		assert michael.following?(archer)
		assert archer.followers.include?(michael)
		michael.unfollow(archer)
		assert_not michael.following?(archer)
	end
end
