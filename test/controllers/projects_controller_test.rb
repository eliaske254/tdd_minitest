require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    sign_in users(:regular)
  end

  test "redirected if not logged in" do
    sign_out :user
    get projects_url
    assert_response :redirect
    follow_redirect!
    assert_select "h2", "Log in"
  end

  test "cannot create a project with invalid attributes" do
    assert_no_difference("Project.count") do
      post projects_url, params: {project: {title: ""}}
    end
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference("Project.count") do
      post projects_url, params: {project: {title: @project.title}}
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    put project_url(@project), params: {project: {title: "Updated Project"}}
    assert_redirected_to project_url(@project)
    @project.reload
    assert_equal "Updated Project", @project.title
  end

  test "cannot update project with invalid attributes" do
    put project_url(@project), params: {project: {title: ""}}
    assert_response 422
    assert_select "h1", "Editing project"
  end

  # test 'should update project' do
  #   patch project_url(@project), params: { project: { title: @project.title } }
  #   assert_redirected_to project_url(@project)
  # end

  test "should destroy project" do
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
