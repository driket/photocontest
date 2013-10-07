require 'test_helper'

class ContestsControllerTest < ActionController::TestCase
  setup do
    @contest = contests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contest" do
    assert_difference('Contest.count') do
      post :create, contest: { body: @contest.body, date_end: @contest.date_end, date_start: @contest.date_start, max_photos_per_user: @contest.max_photos_per_user, max_vote_per_user: @contest.max_vote_per_user, title: @contest.title, vote_end: @contest.vote_end, vote_start: @contest.vote_start }
    end

    assert_redirected_to contest_path(assigns(:contest))
  end

  test "should show contest" do
    get :show, id: @contest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contest
    assert_response :success
  end

  test "should update contest" do
    put :update, id: @contest, contest: { body: @contest.body, date_end: @contest.date_end, date_start: @contest.date_start, max_photos_per_user: @contest.max_photos_per_user, max_vote_per_user: @contest.max_vote_per_user, title: @contest.title, vote_end: @contest.vote_end, vote_start: @contest.vote_start }
    assert_redirected_to contest_path(assigns(:contest))
  end

  test "should destroy contest" do
    assert_difference('Contest.count', -1) do
      delete :destroy, id: @contest
    end

    assert_redirected_to contests_path
  end
end
