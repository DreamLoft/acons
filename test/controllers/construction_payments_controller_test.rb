require 'test_helper'

class ConstructionPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @construction_payment = construction_payments(:one)
  end

  test "should get index" do
    get construction_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_construction_payment_url
    assert_response :success
  end

  test "should create construction_payment" do
    assert_difference('ConstructionPayment.count') do
      post construction_payments_url, params: { construction_payment: { amount_paid: @construction_payment.amount_paid, payee_account: @construction_payment.payee_account, payee_name: @construction_payment.payee_name, payemnt_category: @construction_payment.payemnt_category, payment_date: @construction_payment.payment_date, payment_info: @construction_payment.payment_info, payment_mode: @construction_payment.payment_mode, project_id: @construction_payment.project_id } }
    end

    assert_redirected_to construction_payment_url(ConstructionPayment.last)
  end

  test "should show construction_payment" do
    get construction_payment_url(@construction_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_construction_payment_url(@construction_payment)
    assert_response :success
  end

  test "should update construction_payment" do
    patch construction_payment_url(@construction_payment), params: { construction_payment: { amount_paid: @construction_payment.amount_paid, payee_account: @construction_payment.payee_account, payee_name: @construction_payment.payee_name, payemnt_category: @construction_payment.payemnt_category, payment_date: @construction_payment.payment_date, payment_info: @construction_payment.payment_info, payment_mode: @construction_payment.payment_mode, project_id: @construction_payment.project_id } }
    assert_redirected_to construction_payment_url(@construction_payment)
  end

  test "should destroy construction_payment" do
    assert_difference('ConstructionPayment.count', -1) do
      delete construction_payment_url(@construction_payment)
    end

    assert_redirected_to construction_payments_url
  end
end
