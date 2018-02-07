require 'test_helper'

class OfficeCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_customer = office_customers(:one)
  end

  test "should get index" do
    get office_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_office_customer_url
    assert_response :success
  end

  test "should create office_customer" do
    assert_difference('OfficeCustomer.count') do
      post office_customers_url, params: { office_customer: { broker: @office_customer.broker, budget: @office_customer.budget, comments: @office_customer.comments, date_of_enquiry: @office_customer.date_of_enquiry, email: @office_customer.email, from_where: @office_customer.from_where, looking_for: @office_customer.looking_for, name: @office_customer.name, phone: @office_customer.phone, source: @office_customer.source, status: @office_customer.status } }
    end

    assert_redirected_to office_customer_url(OfficeCustomer.last)
  end

  test "should show office_customer" do
    get office_customer_url(@office_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_customer_url(@office_customer)
    assert_response :success
  end

  test "should update office_customer" do
    patch office_customer_url(@office_customer), params: { office_customer: { broker: @office_customer.broker, budget: @office_customer.budget, comments: @office_customer.comments, date_of_enquiry: @office_customer.date_of_enquiry, email: @office_customer.email, from_where: @office_customer.from_where, looking_for: @office_customer.looking_for, name: @office_customer.name, phone: @office_customer.phone, source: @office_customer.source, status: @office_customer.status } }
    assert_redirected_to office_customer_url(@office_customer)
  end

  test "should destroy office_customer" do
    assert_difference('OfficeCustomer.count', -1) do
      delete office_customer_url(@office_customer)
    end

    assert_redirected_to office_customers_url
  end
end
