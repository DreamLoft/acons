class OfficeCustomersController < ApplicationController
  before_action :set_office_customer, only: [:show, :edit, :update, :destroy]

  # GET /office_customers
  # GET /office_customers.json
  def index
    @office_customers = OfficeCustomer.all
  end

  # GET /office_customers/1
  # GET /office_customers/1.json
  def show
  end

  # GET /office_customers/new
  def new
    @office_customer = OfficeCustomer.new
  end

  # GET /office_customers/1/edit
  def edit
  end

  # POST /office_customers
  # POST /office_customers.json
  def create
    @office_customer = OfficeCustomer.new(office_customer_params)

    respond_to do |format|
      if @office_customer.save
        format.html { redirect_to @office_customer, notice: 'Office customer was successfully created.' }
        format.json { render :show, status: :created, location: @office_customer }
      else
        format.html { render :new }
        format.json { render json: @office_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_customers/1
  # PATCH/PUT /office_customers/1.json
  def update
    respond_to do |format|
      if @office_customer.update(office_customer_params)
        format.html { redirect_to @office_customer, notice: 'Office customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_customer }
      else
        format.html { render :edit }
        format.json { render json: @office_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_customers/1
  # DELETE /office_customers/1.json
  def destroy
    @office_customer.destroy
    respond_to do |format|
      format.html { redirect_to office_customers_url, notice: 'Office customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_customer
      @office_customer = OfficeCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_customer_params
      params.require(:office_customer).permit(:name, :phone, :email, :date_of_enquiry, :from_where, :looking_for, :budget, :broker, :status, :comments, :source)
    end
end