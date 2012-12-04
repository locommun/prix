require 'test_helper'

class DialogsControllerTest < ActionController::TestCase
  setup do
    @dialog = dialogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dialogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dialog" do
    assert_difference('Dialog.count') do
      post :create, dialog: { billboard_id: @dialog.billboard_id, parent: @dialog.parent, text: @dialog.text, user_id: @dialog.user_id }
    end

    assert_redirected_to dialog_path(assigns(:dialog))
  end

  test "should show dialog" do
    get :show, id: @dialog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dialog
    assert_response :success
  end

  test "should update dialog" do
    put :update, id: @dialog, dialog: { billboard_id: @dialog.billboard_id, parent: @dialog.parent, text: @dialog.text, user_id: @dialog.user_id }
    assert_redirected_to dialog_path(assigns(:dialog))
  end

  test "should destroy dialog" do
    assert_difference('Dialog.count', -1) do
      delete :destroy, id: @dialog
    end

    assert_redirected_to dialogs_path
  end
end
