require 'test_helper'

class ClientshipsControllerTest < ActionController::TestCase
  setup do
    @clientship = clientships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clientship" do
    assert_difference('Clientship.count') do
      post :create, clientship: @clientship.attributes
    end

    assert_redirected_to clientship_path(assigns(:clientship))
  end

  test "should show clientship" do
    get :show, id: @clientship.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clientship.to_param
    assert_response :success
  end

  test "should update clientship" do
    put :update, id: @clientship.to_param, clientship: @clientship.attributes
    assert_redirected_to clientship_path(assigns(:clientship))
  end

  test "should destroy clientship" do
    assert_difference('Clientship.count', -1) do
      delete :destroy, id: @clientship.to_param
    end

    assert_redirected_to clientships_path
  end
end
