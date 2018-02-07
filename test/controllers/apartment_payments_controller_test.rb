require 'test_helper'

class ApartmentPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apartment_payment = apartment_payments(:one)
  end

  test "should get index" do
    get apartment_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_apartment_payment_url
    assert_response :success
  end

  test "should create apartment_payment" do
    assert_difference('ApartmentPayment.count') do
      post apartment_payments_url, params: { apartment_payment: { amount_paid: @apartment_payment.amount_paid, office_deal_id: @apartment_payment.office_deal_id, payment_date: @apartment_payment.payment_date } }
    end

    assert_redirected_to apartment_payment_url(ApartmentPayment.last)
  end

  test "should show apartment_payment" do
    get apartment_payment_url(@apartment_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_apartment_payment_url(@apartment_payment)
    assert_response :success
  end

  test "should update apartment_payment" do
    patch apartment_payment_url(@apartment_payment), params: { apartment_payment: { amount_paid: @apartment_payment.amount_paid, office_deal_id: @apartment_payment.office_deal_id, payment_date: @apartment_payment.payment_date } }
    assert_redirected_to apartment_payment_url(@apartment_payment)
  end

  test "should destroy apartment_payment" do
    assert_difference('ApartmentPayment.count', -1) do
      delete apartment_payment_url(@apartment_payment)
    end

    assert_redirected_to apartment_payments_url
  end
end
