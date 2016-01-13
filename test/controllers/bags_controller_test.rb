require 'test_helper'

class BagsControllerTest < ActionController::TestCase
  setup do
    @bag = bags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bag" do
    assert_difference('Bag.count') do
      post :create, bag: { availability: @bag.availability, brand: @bag.brand, description: @bag.description, name: @bag.name, price: @bag.price }
    end

    assert_redirected_to bag_path(assigns(:bag))
  end

  test "should show bag" do
    get :show, id: @bag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bag
    assert_response :success
  end

  test "should update bag" do
    patch :update, id: @bag, bag: { availability: @bag.availability, brand: @bag.brand, description: @bag.description, name: @bag.name, price: @bag.price }
    assert_redirected_to bag_path(assigns(:bag))
  end

  test "should destroy bag" do
    assert_difference('Bag.count', -1) do
      delete :destroy, id: @bag
    end

    assert_redirected_to bags_path
  end
end
