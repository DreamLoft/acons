class PayeeCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payee_category, only: [:show, :edit, :update, :destroy]

  # GET /payee_categories
  # GET /payee_categories.json
  def index
    @payee_categories = PayeeCategory.all.page params[:page]
  end

  # GET /payee_categories/1
  # GET /payee_categories/1.json
  def show
  end

  # GET /payee_categories/new
  def new
    @payee_category = PayeeCategory.new
  end

  # GET /payee_categories/1/edit
  def edit
  end

  # POST /payee_categories
  # POST /payee_categories.json
  def create
    @payee_category = PayeeCategory.new(payee_category_params)

    respond_to do |format|
      if @payee_category.save
        format.html { redirect_to @payee_category, notice: 'Payee category was successfully created.' }
        format.json { render :show, status: :created, location: @payee_category }
      else
        format.html { render :new }
        format.json { render json: @payee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payee_categories/1
  # PATCH/PUT /payee_categories/1.json
  def update
    respond_to do |format|
      if @payee_category.update(payee_category_params)
        format.html { redirect_to @payee_category, notice: 'Payee category was successfully updated.' }
        format.json { render :show, status: :ok, location: @payee_category }
      else
        format.html { render :edit }
        format.json { render json: @payee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payee_categories/1
  # DELETE /payee_categories/1.json
  def destroy
    @payee_category.destroy
    respond_to do |format|
      format.html { redirect_to payee_categories_url, notice: 'Payee category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payee_category
      @payee_category = PayeeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payee_category_params
      params.require(:payee_category).permit(:category_name, :category_description)
    end
end
