require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  setup do
    @news = create :news
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @news.id
    assert_response :success
  end
end
