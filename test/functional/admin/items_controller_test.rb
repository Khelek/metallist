require 'test_helper'

class Admin::ItemsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    sign_in @admin
    @item = create :item
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for :item
    post :create, item: attrs
    assert_response :redirect
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get update" do
    attrs = attributes_for :item
    put :update, id: @item, item: attrs
    assert_response :redirect
    @item.reload
    assert attrs[:title], @item.title
  end

  test "should get destroy" do
    delete :destroy, id: @item
    assert_response :redirect
    assert !Item.exists?(@item)
  end
end
