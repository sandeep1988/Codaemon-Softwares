require 'test_helper'

class TesturlsControllerTest < ActionController::TestCase
  setup do
    @testurl = testurls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testurls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testurl" do
    assert_difference('Testurl.count') do
      post :create, testurl: { name: @testurl.name }
    end

    assert_redirected_to testurl_path(assigns(:testurl))
  end

  test "should show testurl" do
    get :show, id: @testurl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testurl
    assert_response :success
  end

  test "should update testurl" do
    patch :update, id: @testurl, testurl: { name: @testurl.name }
    assert_redirected_to testurl_path(assigns(:testurl))
  end

  test "should destroy testurl" do
    assert_difference('Testurl.count', -1) do
      delete :destroy, id: @testurl
    end

    assert_redirected_to testurls_path
  end
end
