require 'test_helper'

class ConstructionStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @construction_stock = construction_stocks(:one)
  end

  test "should get index" do
    get construction_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_construction_stock_url
    assert_response :success
  end

  test "should create construction_stock" do
    assert_difference('ConstructionStock.count') do
      post construction_stocks_url, params: { construction_stock: { item_name: @construction_stock.item_name, stock_quantity: @construction_stock.stock_quantity } }
    end

    assert_redirected_to construction_stock_url(ConstructionStock.last)
  end

  test "should show construction_stock" do
    get construction_stock_url(@construction_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_construction_stock_url(@construction_stock)
    assert_response :success
  end

  test "should update construction_stock" do
    patch construction_stock_url(@construction_stock), params: { construction_stock: { item_name: @construction_stock.item_name, stock_quantity: @construction_stock.stock_quantity } }
    assert_redirected_to construction_stock_url(@construction_stock)
  end

  test "should destroy construction_stock" do
    assert_difference('ConstructionStock.count', -1) do
      delete construction_stock_url(@construction_stock)
    end

    assert_redirected_to construction_stocks_url
  end
end
