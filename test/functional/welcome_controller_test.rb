require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    history = create :page
    history.slug = "history"
    history.save
    get :index
    assert_response :success
  end

end
