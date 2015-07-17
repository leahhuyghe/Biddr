require 'test_helper'

class AuctionsControllerTest < ActionController::TestCase
  setup do
    @auction = auctions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auctions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auction" do
    assert_difference('Auction.count') do
      post :create, auction: { aasm_state: @auction.aasm_state, current_price: @auction.current_price, description: @auction.description, ends_on: @auction.ends_on, reserve_price: @auction.reserve_price, title: @auction.title, user_id: @auction.user_id }
    end

    assert_redirected_to auction_path(assigns(:auction))
  end

  test "should show auction" do
    get :show, id: @auction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auction
    assert_response :success
  end

  test "should update auction" do
    patch :update, id: @auction, auction: { aasm_state: @auction.aasm_state, current_price: @auction.current_price, description: @auction.description, ends_on: @auction.ends_on, reserve_price: @auction.reserve_price, title: @auction.title, user_id: @auction.user_id }
    assert_redirected_to auction_path(assigns(:auction))
  end

  test "should destroy auction" do
    assert_difference('Auction.count', -1) do
      delete :destroy, id: @auction
    end

    assert_redirected_to auctions_path
  end
end
