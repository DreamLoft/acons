require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_url
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post bookings_url, params: { booking: { booked_from: @booking.booked_from, booked_till: @booking.booked_till, booking_amount: @booking.booking_amount, booking_date: @booking.booking_date, booking_status: @booking.booking_status, customer_email: @booking.customer_email, customer_mobile: @booking.customer_mobile, customer_name: @booking.customer_name, total_guests: @booking.total_guests } }
    end

    assert_redirected_to booking_url(Booking.last)
  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_url(@booking)
    assert_response :success
  end

  test "should update booking" do
    patch booking_url(@booking), params: { booking: { booked_from: @booking.booked_from, booked_till: @booking.booked_till, booking_amount: @booking.booking_amount, booking_date: @booking.booking_date, booking_status: @booking.booking_status, customer_email: @booking.customer_email, customer_mobile: @booking.customer_mobile, customer_name: @booking.customer_name, total_guests: @booking.total_guests } }
    assert_redirected_to booking_url(@booking)
  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete booking_url(@booking)
    end

    assert_redirected_to bookings_url
  end
end
