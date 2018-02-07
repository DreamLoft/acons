require 'test_helper'

class ConstructionStockFillingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @construction_stock_filling = construction_stock_fillings(:one)
  end

  test "should get index" do
    get construction_stock_fillings_url
    assert_response :success
  end

  test "should get new" do
    get new_construction_stock_filling_url
    assert_response :success
  end

  test "should create construction_stock_filling" do
    assert_difference('ConstructionStockFilling.count') do
      post construction_stock_fillings_url, params: { construction_stock_filling: { accepted_by: @construction_stock_filling.accepted_by, construction_stock_id: @construction_stock_filling.construction_stock_id, filling_date: @construction_stock_filling.filling_date, filling_location: @construction_stock_filling.filling_location, quantity: @construction_stock_filling.quantity } }
    end

    assert_redirected_to construction_stock_filling_url(ConstructionStockFilling.last)
  end

  test "should show construction_stock_filling" do
    get construction_stock_filling_url(@construction_stock_filling)
    assert_response :success
  end

  test "should get edit" do
    get edit_construction_stock_filling_url(@construction_stock_filling)
    assert_response :success
  end

  test "should update construction_stock_filling" do
    patch construction_stock_filling_url(@construction_stock_filling), params: { construction_stock_filling: { accepted_by: @construction_stock_filling.accepted_by, construction_stock_id: @construction_stock_filling.construction_stock_id, filling_date: @construction_stock_filling.filling_date, filling_location: @construction_stock_filling.filling_location, quantity: @construction_stock_filling.quantity } }
    assert_redirected_to construction_stock_filling_url(@construction_stock_filling)
  end

  test "should destroy construction_stock_filling" do
    assert_difference('ConstructionStockFilling.count', -1) do
      delete construction_stock_filling_url(@construction_stock_filling)
    end

    assert_redirected_to construction_stock_fillings_url
  end
end
