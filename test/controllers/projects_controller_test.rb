require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @project = projects(:p1)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Project.count' do
      post :create, project: { name: "Lorem" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Project.count' do
      delete :destroy, id: @project
    end
    assert_redirected_to login_url
  end
end
