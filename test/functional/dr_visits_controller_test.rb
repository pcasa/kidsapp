require 'test_helper'

class DrVisitsControllerTest < ActionController::TestCase
  setup do
    @dr_visit = dr_visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dr_visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dr_visit" do
    assert_difference('DrVisit.count') do
      post :create, dr_visit: { appointment: @dr_visit.appointment, child_id: @dr_visit.child_id }
    end

    assert_redirected_to dr_visit_path(assigns(:dr_visit))
  end

  test "should show dr_visit" do
    get :show, id: @dr_visit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dr_visit
    assert_response :success
  end

  test "should update dr_visit" do
    put :update, id: @dr_visit, dr_visit: { appointment: @dr_visit.appointment, child_id: @dr_visit.child_id }
    assert_redirected_to dr_visit_path(assigns(:dr_visit))
  end

  test "should destroy dr_visit" do
    assert_difference('DrVisit.count', -1) do
      delete :destroy, id: @dr_visit
    end

    assert_redirected_to dr_visits_path
  end
end
