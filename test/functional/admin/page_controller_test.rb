require 'test_helper'

class Admin::PageControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    sign_in @admin
    @page = create :page
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for :page
    post :create, page: attrs
    assert_response :redirect
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get update" do
    attrs = attributes_for :page
    put :update, id: @page, page: attrs
    assert_response :redirect
    @page.reload
    assert attrs[:title], @page.title
  end

  test "should get destroy" do
    delete :destroy, id: @page
    assert_response :redirect
    assert !Page.exists?(@page)
  end

end
