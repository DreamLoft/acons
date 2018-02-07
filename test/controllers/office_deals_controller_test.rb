require 'test_helper'

class OfficeDealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_deal = office_deals(:one)
  end

  test "should get index" do
    get office_deals_url
    assert_response :success
  end

  test "should get new" do
    get new_office_deal_url
    assert_response :success
  end

  test "should create office_deal" do
    assert_difference('OfficeDeal.count') do
      post office_deals_url, params: { office_deal: { apartment_id: @office_deal.apartment_id, base_price: @office_deal.base_price, club_membership_charges: @office_deal.club_membership_charges, developement_charges: @office_deal.developement_charges, furniture_charges: @office_deal.furniture_charges, maintenance_charges: @office_deal.maintenance_charges, office_customer_id: @office_deal.office_customer_id, other_charges: @office_deal.other_charges, parking_charges: @office_deal.parking_charges, registration_charges: @office_deal.registration_charges, stamp_duty: @office_deal.stamp_duty } }
    end

    assert_redirected_to office_deal_url(OfficeDeal.last)
  end

  test "should show office_deal" do
    get office_deal_url(@office_deal)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_deal_url(@office_deal)
    assert_response :success
  end

  test "should update office_deal" do
    patch office_deal_url(@office_deal), params: { office_deal: { apartment_id: @office_deal.apartment_id, base_price: @office_deal.base_price, club_membership_charges: @office_deal.club_membership_charges, developement_charges: @office_deal.developement_charges, furniture_charges: @office_deal.furniture_charges, maintenance_charges: @office_deal.maintenance_charges, office_customer_id: @office_deal.office_customer_id, other_charges: @office_deal.other_charges, parking_charges: @office_deal.parking_charges, registration_charges: @office_deal.registration_charges, stamp_duty: @office_deal.stamp_duty } }
    assert_redirected_to office_deal_url(@office_deal)
  end

  test "should destroy office_deal" do
    assert_difference('OfficeDeal.count', -1) do
      delete office_deal_url(@office_deal)
    end

    assert_redirected_to office_deals_url
  end
end
