require 'test_helper'

class BowelMovementsControllerTest < ActionController::TestCase
  setup do
    @bowel_movement = bowel_movements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bowel_movements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bowel_movement" do
    assert_difference('BowelMovement.count') do
      post :create, bowel_movement: { bowel_time: @bowel_movement.bowel_time, child_id: @bowel_movement.child_id, color: @bowel_movement.color, consistency: @bowel_movement.consistency }
    end

    assert_redirected_to bowel_movement_path(assigns(:bowel_movement))
  end

  test "should show bowel_movement" do
    get :show, id: @bowel_movement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bowel_movement
    assert_response :success
  end

  test "should update bowel_movement" do
    put :update, id: @bowel_movement, bowel_movement: { bowel_time: @bowel_movement.bowel_time, child_id: @bowel_movement.child_id, color: @bowel_movement.color, consistency: @bowel_movement.consistency }
    assert_redirected_to bowel_movement_path(assigns(:bowel_movement))
  end

  test "should destroy bowel_movement" do
    assert_difference('BowelMovement.count', -1) do
      delete :destroy, id: @bowel_movement
    end

    assert_redirected_to bowel_movements_path
  end
end
