module BookingsHelper
  def get_room_service_amount(booking_id)
    total=0
     @room_services= RoomService.where(booking_id: booking_id)
     @room_services.each do |rs|
       total= total+ rs.price
     end
    total
  end
  def amount_paid(booking_id)
    total_paid=0
    @service_payments= Payment.where(booking_id: booking_id)
    @service_payments.each do |sp|
      total_paid= total_paid+ sp.amount_paid
    end
    total_paid
  end
end
