class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_guest, except: [:index]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    if (params[:start_date] or params[:end_date])
      @bookings = Booking.starting_from(params[:start_date]).ending_at(params[:end_date]).page params[:page]
    else
      @bookings = Booking.current_bookings.page params[:page]
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    #@payments= @booking.payments
    @rooms_booked= @booking.rooms
    @room_services= @booking.room_services
    #render json: @room_services
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    
  end

  # GET /bookings/1/edit
  def edit
    
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new
    begin
      Booking.transaction do
        @booking.assign_attributes(booking_params)
        @booking.guest_id = @guest.id
        @booking.save!
        if params[:booking][:rooms]
          rs= params[:booking][:rooms]
          rs.each do|room|
            @room_booking= RoomBooking.new
            @room_booking.room_id= room
            @room_booking.booking_id= @booking.id
            @room_booking.save!
          end
          redirect_to guest_booking_path(@booking.guest_id, @booking.id), notice: 'Booking was successfully updated.'
        end
      end
    rescue Exception => e
      redirect_to new_guest_booking(@booking.guest_id), notice: e.message
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    begin
      Booking.transaction do
        @booking.assign_attributes(booking__patch_params)
        @booking.guest_id = @guest.id
        booked_rooms =  @booking&.room_bookings&.delete_all
        @booking.save!
        if params[:booking][:rooms]
          rs= params[:booking][:rooms]
          rs.each do|room|
            @room_booking= RoomBooking.new
            @room_booking.room_id= room
            @room_booking.booking_id= @booking.id
            @room_booking.save!
          end
          redirect_to guest_booking_path(@booking.guest_id, @booking.id), notice: 'Booking was successfully updated.'
        end
      end
    rescue Exception => e
      redirect_to edit_guest_booking_path(@booking.guest_id, @booking.id), notice: e.message
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_guest
      @guest = Guest.find(params[:guest_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.permit(:booking_date, :total_guests, :booking_status, :booked_from, :booked_till, :booking_amount, :paid_amount, :booking_rooms)
    end

    def booking__patch_params
      params.require("patch").permit(:booking_date, :total_guests, :booking_status, :booked_from, :booked_till, :booking_amount, :paid_amount, :booking_rooms)
    end
end
