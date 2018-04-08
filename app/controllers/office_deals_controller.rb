class OfficeDealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_office_deal, only: [:show, :edit, :update, :destroy]

  # GET /office_deals
  # GET /office_deals.json
  def index
    @office_deals = OfficeDeal.all
  end

  # GET /office_deals/1
  # GET /office_deals/1.json
  def show
  end

  # GET /office_deals/new
  def new
    @office_deal = OfficeDeal.new
    @projects= Project.all
    @office_customers= OfficeCustomer.all
  end

  # GET /office_deals/1/edit
  def edit
    @projects= Project.all
    @office_customers= OfficeCustomer.all
  end

  # POST /office_deals
  # POST /office_deals.json
  def create
    @office_deal = OfficeDeal.new(office_deal_params)

    respond_to do |format|
      if @office_deal.save
        format.html { redirect_to @office_deal, notice: 'Office deal was successfully created.' }
        format.json { render :show, status: :created, location: @office_deal }
      else
        format.html { render :new }
        format.json { render json: @office_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_deals/1
  # PATCH/PUT /office_deals/1.json
  def update
    respond_to do |format|
      if @office_deal.update(office_deal_params)
        format.html { redirect_to @office_deal, notice: 'Office deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_deal }
      else
        format.html { render :edit }
        format.json { render json: @office_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_deals/1
  # DELETE /office_deals/1.json
  def destroy
    @office_deal.destroy
    respond_to do |format|
      format.html { redirect_to office_deals_url, notice: 'Office deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_deal
      @office_deal = OfficeDeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_deal_params
      params.require(:office_deal).permit(:office_customer_id, :apartment_id, :base_price, :stamp_duty, :registration_charges, :other_charges, :maintenance_charges, :parking_charges, :developement_charges, :club_membership_charges, :furniture_charges, :total_price)
    end
end
