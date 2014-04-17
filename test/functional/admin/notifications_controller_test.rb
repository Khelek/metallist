require 'test_helper'

class Admin::NotificationsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    sign_in @admin
    @notification = create :notification
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notification
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for :notification
    post :create, notification: attrs
    assert_response :redirect
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get update" do
    attrs = attributes_for :notification
    put :update, id: @notification, notification: attrs
    assert_response :redirect
    @notification.reload
    assert attrs[:title], @notification.title
  end

  test "should get destroy" do
    delete :destroy, id: @notification
    assert_response :redirect
    assert !Notification.exists?(@notification)
  end
end
