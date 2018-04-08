class RoomServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room_service, only: [:show, :edit, :update, :destroy]
  before_action :set_booking
  # GET /room_services
  # GET /room_services.json
  def index
    @room_services = @booking.room_services
    #@room_services= RoomService.where(booking_id: @booking.id)
  end

  # GET /room_services/1
  # GET /room_services/1.json
  def show
  end

  # GET /room_services/new
  def new
    @room_service  = RoomService.new
     @stock_items= StockItem.all
    @rooms= Room.where(id: RoomBooking.where(booking_id: @booking.id).pluck(:room_id) )

  # render json: @rooms.empty?
    # @bookings= Booking.where(:booking_status => "Confirmed")
  end

  # GET /room_services/1/edit
  def edit
    @stock_items = StockItem.all
   @rooms= Room.where(id: RoomBooking.where(booking_id: @booking.id).pluck(:room_id) )
  end

  # POST /room_services
  # POST /room_services.json
  def create
     @room_service = RoomService.new
     @room_service.booking_id= @booking.id
     @room_service.room_id= params[:room_id]
     @room_service.quantity= params[:room_service][:quantity]
     @room_service.price= params[:room_service][:price]
     @room_service.stock_item_id= params[:stock_item_id]
#     render json: @room_service
    respond_to do |format|
      if @room_service.save
        format.html { redirect_to booking_path(@booking.id), notice: 'Room service was successfully created.' }
        format.json { render :show, status: :created, location: @room_service }
      else
        format.html { render :new }
        format.json { render json: @room_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_services/1
  # PATCH/PUT /room_services/1.json
  def update
    respond_to do |format|
      if @room_service.update(room_service_params)
        format.html { redirect_to @room_service, notice: 'Room service was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_service }
      else
        format.html { render :edit }
        format.json { render json: @room_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_services/1
  # DELETE /room_services/1.json
  def destroy
    @room_service.destroy
    respond_to do |format|
      format.html { redirect_to room_services_url, notice: 'Room service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_service
      @room_service = RoomService.find(params[:id])
    end
    def set_booking
      @booking= Booking.find(params[:booking_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def room_service_params
      params.require(:room_service).permit(:stock_item_id, :booking_id, :room_id, :price, :quantity)
    end
end
