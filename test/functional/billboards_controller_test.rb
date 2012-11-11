require 'test_helper'

class BillboardsControllerTest < ActionController::TestCase
  setup do
    @billboard = billboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create billboard" do
    assert_difference('Billboard.count') do
      post :create, billboard: { description: @billboard.description, gmaps: @billboard.gmaps, latitude: @billboard.latitude, longitude: @billboard.longitude, name: @billboard.name }
    end

    assert_redirected_to billboard_path(assigns(:billboard))
  end

  test "should show billboard" do
    get :show, id: @billboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @billboard
    assert_response :success
  end

  test "should update billboard" do
    put :update, id: @billboard, billboard: { description: @billboard.description, gmaps: @billboard.gmaps, latitude: @billboard.latitude, longitude: @billboard.longitude, name: @billboard.name }
    assert_redirected_to billboard_path(assigns(:billboard))
  end

  test "should destroy billboard" do
    assert_difference('Billboard.count', -1) do
      delete :destroy, id: @billboard
    end

    assert_redirected_to billboards_path
  end
end
