require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
  end
  

  test "should authenticate" do
    attrs = { login: @admin.login, password: @admin.password }

    post :create, admin: attrs
    assert_redirected_to admin_root_path
    assert signed_as_admin?
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete destroy" do
    sign_in @admin
    delete :destroy
    assert_response :redirect
    assert !signed_as_admin?
  end

end
