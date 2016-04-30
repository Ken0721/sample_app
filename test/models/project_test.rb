require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
   def setup
     @user = users(:michael)
     #@project = Project.new(name: "food", user_id: @user.id)
		 @project = @user.projects.build(name: "FOOD")
   end

   test "should be valid" do
     assert @project.valid?
   end
   
	 test "user id should be present" do
     @project.user_id = nil
     assert_not @project.valid?
   end

	test "order should be most recent first" do
		assert_equal projects(:most_recent), Project.first
	end
	
end
