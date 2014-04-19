require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :admin
    sign_in @user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for :user
    attrs[:password_confirmation] = attrs[:password]
    post :create, user: attrs
    assert_response :redirect
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get update" do
    attrs = attributes_for :user
    put :update, id: @user, user: attrs
    assert_response :redirect
    @user.reload
    assert attrs[:first_name], @user.first_name
  end

  test "should get destroy" do
    delete :destroy, id: @user
    assert_response :redirect
    assert !User.exists?(@user)
  end
end
