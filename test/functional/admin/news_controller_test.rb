require 'test_helper'

class Admin::NewsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    sign_in @admin
    @news = create :news
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @news
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for :news
    post :create, news: attrs
    assert_response :redirect
    @news = News.last
    assert_equal attrs[:title], @news.title
  end

  test "should get update" do
    attrs = attributes_for :news
    put :update, id: @news, news: attrs
    assert_response :redirect
    @news.reload
    assert attrs[:title], @news.title
  end

  test "should get destroy" do
    delete :destroy, id: @news.id
    assert_response :redirect
    assert !News.exists?(@news)
  end

end
