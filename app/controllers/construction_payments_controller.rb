class ConstructionPaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_construction_payment, only: [:show, :edit, :update, :destroy]

  def index
    @construction_payments = ConstructionPayment.search_by_project(params[:project_id]).search_by_payee(params[:payee_id]).search_by_intermediary(params[:intermediary_id])
  end


  def show
  end


  def new
    @construction_payment = ConstructionPayment.new
  end

  def edit
  end
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

  def destroy
    @construction_payment.destroy
    respond_to do |format|
      format.html { redirect_to construction_payments_url, notice: 'Construction payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_construction_payment
      @construction_payment = ConstructionPayment.find(params[:id])
    end

    def construction_payment_params
      params.require(:construction_payment).permit(:payee_id, :amount_paid, :payment_date, :payment_mode, :payemnt_category, :project_id, :payment_info, :intermediary, :payee_category_id)
    end
end
