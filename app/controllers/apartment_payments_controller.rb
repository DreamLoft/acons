class ApartmentPaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_office_deal
  before_action :set_apartment_payment, only: [:show, :edit, :update, :destroy]

  # GET /apartment_payments
  # GET /apartment_payments.json
  def index
    @apartment_payments = ApartmentPayment.where(:office_deal_id => @office_deal.id).page params[:page]
  end

  # GET /apartment_payments/1
  # GET /apartment_payments/1.json
  def show
  end

  # GET /apartment_payments/new
  def new
    @apartment_payment = @office_deal.apartment_payments.build
  end

  # GET /apartment_payments/1/edit
  def edit
  end

  # POST /apartment_payments
  # POST /apartment_payments.json
  def create
    @apartment_payment = ApartmentPayment.new(apartment_payment_params)
    @apartment_payment.office_deal_id= @office_deal.id

    respond_to do |format|
      if @apartment_payment.save
        format.html { redirect_to office_deal_apartment_payments_path, notice: 'Apartment payment was successfully created.' }
#        format.json { render :show, status: :created, location: @apartment_payment }
      else
        format.html { render :new }
        format.json { render json: @apartment_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartment_payments/1
  # PATCH/PUT /apartment_payments/1.json
  def update
    respond_to do |format|
      if @apartment_payment.update(apartment_payment_params)
        format.html { redirect_to office_deal_apartment_payment_path(@office_deal,@apartment_payment), notice: 'Apartment payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment_payment }
      else
        format.html { render :edit }
        format.json { render json: @apartment_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartment_payments/1
  # DELETE /apartment_payments/1.json
  def destroy
    @apartment_payment.destroy
    respond_to do |format|
      format.html { redirect_to apartment_payments_url, notice: 'Apartment payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment_payment
      @apartment_payment = ApartmentPayment.find(params[:id])
    end

    def set_office_deal
      @office_deal= OfficeDeal.find(params[:office_deal_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_payment_params
      params.require(:apartment_payment).permit(:office_deal_id, :amount_paid, :payment_date, :description)
    end
end
