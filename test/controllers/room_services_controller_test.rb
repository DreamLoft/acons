require 'test_helper'

class RoomServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_service = room_services(:one)
  end

  test "should get index" do
    get room_services_url
    assert_response :success
  end

  test "should get new" do
    get new_room_service_url
    assert_response :success
  end

  test "should create room_service" do
    assert_difference('RoomService.count') do
      post room_services_url, params: { room_service: { booking_id: @room_service.booking_id, room_id: @room_service.room_id, stock_item_id: @room_service.stock_item_id } }
    end

    assert_redirected_to room_service_url(RoomService.last)
  end

  test "should show room_service" do
    get room_service_url(@room_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_service_url(@room_service)
    assert_response :success
  end

  test "should update room_service" do
    patch room_service_url(@room_service), params: { room_service: { booking_id: @room_service.booking_id, room_id: @room_service.room_id, stock_item_id: @room_service.stock_item_id } }
    assert_redirected_to room_service_url(@room_service)
  end

  test "should destroy room_service" do
    assert_difference('RoomService.count', -1) do
      delete room_service_url(@room_service)
    end

    assert_redirected_to room_services_url
  end
end
