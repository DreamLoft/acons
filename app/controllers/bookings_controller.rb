class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    if (params[:start_date] or params[:end_date])
      @bookings = Booking.where("booked_from BETWEEN  ? AND ? ", params[:start_date], params[:end_date])
#      render json: @payments
    else
    @bookings = Booking.all
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @payments= @booking.payments
    @rooms_booked= @booking.rooms
    @room_services= @booking.room_services
    #render json: @room_services
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @available_rooms= Room.where(room_status: "Available")
  end

  # GET /bookings/1/edit
  def edit
    @available_rooms= Room.where(room_status: "Available")
  end

  # POST /bookings
  # POST /bookings.json
  def create
  #    render json: params[:booking][:rooms]
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        rs= params[:booking][:rooms]
        rs.each do|room|
          @room_booking= RoomBooking.new
          @room_booking.room_id= room
          @room_booking.booking_id= @booking.id
          @room_booking.save
        end
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:customer_name, :customer_email, :customer_mobile, :booking_date, :total_guests, :booking_status, :booked_from, :booked_till, :booking_amount, :paid_amount)
    end
end
