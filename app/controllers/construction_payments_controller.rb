class ConstructionPaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :payee_list, only: [:edit, :new]
  before_action :set_construction_payment, only: [:show, :edit, :update, :destroy]
  # GET /construction_payments
  # GET /construction_payments.json
  def index
    #render json: params
    @construction_payments = ConstructionPayment.all
    @construction_payments = @construction_payments.where(project_id: params[:project_id]) if params[:project_id].present?
    @construction_payments =@construction_payments.where(payee_id: params[:payee_id]) if params[:payee_id].present?
  end

  # GET /construction_payments/1
  # GET /construction_payments/1.json
  def show
  end

  # GET /construction_payments/new
  def new
    @construction_payment = ConstructionPayment.new
  end

  # GET /construction_payments/1/edit
  def edit
  end

  # POST /construction_payments
  # POST /construction_payments.json
  def create
    @construction_payment = ConstructionPayment.new(construction_payment_params)

    respond_to do |format|
      if @construction_payment.save
        format.html { redirect_to @construction_payment, notice: 'Construction payment was successfully created.' }
        format.json { render :show, status: :created, location: @construction_payment }
      else
        format.html { render :new }
        format.json { render json: @construction_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /construction_payments/1
  # PATCH/PUT /construction_payments/1.json
  def update
    respond_to do |format|
      if @construction_payment.update(construction_payment_params)
        format.html { redirect_to @construction_payment, notice: 'Construction payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @construction_payment }
      else
        format.html { render :edit }
        format.json { render json: @construction_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /construction_payments/1
  # DELETE /construction_payments/1.json
  def destroy
    @construction_payment.destroy
    respond_to do |format|
      format.html { redirect_to construction_payments_url, notice: 'Construction payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction_payment
      @construction_payment = ConstructionPayment.find(params[:id])
    end
    def payee_list
      @payees= Payee.all
      @projects= Project.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def construction_payment_params
      params.require(:construction_payment).permit(:payee_name, :payee_account, :amount_paid, :payment_date, :payment_mode, :payemnt_category, :project_id, :payment_info)
    end
end
