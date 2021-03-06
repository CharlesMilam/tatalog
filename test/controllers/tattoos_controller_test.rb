require 'test_helper'

class TattoosControllerTest < ActionController::TestCase
   # *********** Stuff available after a valid request ************
  # puts "assigns", assigns
  # puts "cookies", cookies
  # puts "flash", flash
  # puts "session", session
  # puts "controller", @controller
  # puts "request", @request
  # puts "response", @response.@status

  setup do
    @user = users(:user1)
    @tattoo = tattoos(:tattoo1)
    @artist = artists(:artist1)
    @shop = shops(:shop1)

    @params = {
        id: @tattoo.id,
        user_id: @user.id,
        artist_id: @artist.id,
        shop_id: @shop.id,
        name: @tattoo.name,
        when: @tattoo.when,
        why: @tattoo.why
      }
  end

  teardown do
    @user = nil
  end
  
  test "should get index" do
    get :index, user_id: @user.id
    
    assert_response :success
  end

  test "should get show" do
    get :show, user_id: @user.id, id: @tattoo.id
    assert_response :success
  end

  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end

  test "should create tattoo" do
    post :create, user_id: @user.id, tattoo: @params     
    assert_redirected_to user_tattoos_path
  end

  test "should get edit" do
    get :edit, user_id: @user.id, id: @tattoo.id
    assert_response :success
  end

  test "should update tattoo" do
    put :update, user_id: @user.id, id: @tattoo.id, tattoo: @params     
    assert_redirected_to user_tattoo_path(id: @assigns["tattoo"][:id])
  end

  test "should delete tattoo" do
    get :destroy, user_id: @user.id, id: @tattoo.id
    assert_redirected_to user_tattoos_path
  end

end
