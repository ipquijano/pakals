require 'test_helper'

class SpamPostsControllerTest < ActionController::TestCase
  setup do
    @spam_post = spam_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spam_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spam_post" do
    assert_difference('SpamPost.count') do
      post :create, spam_post: @spam_post.attributes
    end

    assert_redirected_to spam_post_path(assigns(:spam_post))
  end

  test "should show spam_post" do
    get :show, id: @spam_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spam_post
    assert_response :success
  end

  test "should update spam_post" do
    put :update, id: @spam_post, spam_post: @spam_post.attributes
    assert_redirected_to spam_post_path(assigns(:spam_post))
  end

  test "should destroy spam_post" do
    assert_difference('SpamPost.count', -1) do
      delete :destroy, id: @spam_post
    end

    assert_redirected_to spam_posts_path
  end
end
