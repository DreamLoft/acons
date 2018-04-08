require 'test_helper'

class PayeeCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payee_category = payee_categories(:one)
  end

  test "should get index" do
    get payee_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_payee_category_url
    assert_response :success
  end

  test "should create payee_category" do
    assert_difference('PayeeCategory.count') do
      post payee_categories_url, params: { payee_category: { category_description: @payee_category.category_description, category_name: @payee_category.category_name } }
    end

    assert_redirected_to payee_category_url(PayeeCategory.last)
  end

  test "should show payee_category" do
    get payee_category_url(@payee_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_payee_category_url(@payee_category)
    assert_response :success
  end

  test "should update payee_category" do
    patch payee_category_url(@payee_category), params: { payee_category: { category_description: @payee_category.category_description, category_name: @payee_category.category_name } }
    assert_redirected_to payee_category_url(@payee_category)
  end

  test "should destroy payee_category" do
    assert_difference('PayeeCategory.count', -1) do
      delete payee_category_url(@payee_category)
    end

    assert_redirected_to payee_categories_url
  end
end
