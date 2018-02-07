class ConstructionStockFillingsController < ApplicationController
  before_action :set_construction_stock_filling, only: [:show, :edit, :update, :destroy]

  # GET /construction_stock_fillings
  # GET /construction_stock_fillings.json
  def index
    @construction_stock_fillings = ConstructionStockFilling.all
  end

  # GET /construction_stock_fillings/1
  # GET /construction_stock_fillings/1.json
  def show
  end

  # GET /construction_stock_fillings/new
  def new
    @construction_stock_filling = ConstructionStockFilling.new
  end

  # GET /construction_stock_fillings/1/edit
  def edit
  end

  # POST /construction_stock_fillings
  # POST /construction_stock_fillings.json
  def create
    @construction_stock_filling = ConstructionStockFilling.new(construction_stock_filling_params)

    respond_to do |format|
      if @construction_stock_filling.save
        format.html { redirect_to @construction_stock_filling, notice: 'Construction stock filling was successfully created.' }
        format.json { render :show, status: :created, location: @construction_stock_filling }
      else
        format.html { render :new }
        format.json { render json: @construction_stock_filling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /construction_stock_fillings/1
  # PATCH/PUT /construction_stock_fillings/1.json
  def update
    respond_to do |format|
      if @construction_stock_filling.update(construction_stock_filling_params)
        format.html { redirect_to @construction_stock_filling, notice: 'Construction stock filling was successfully updated.' }
        format.json { render :show, status: :ok, location: @construction_stock_filling }
      else
        format.html { render :edit }
        format.json { render json: @construction_stock_filling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /construction_stock_fillings/1
  # DELETE /construction_stock_fillings/1.json
  def destroy
    @construction_stock_filling.destroy
    respond_to do |format|
      format.html { redirect_to construction_stock_fillings_url, notice: 'Construction stock filling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction_stock_filling
      @construction_stock_filling = ConstructionStockFilling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def construction_stock_filling_params
      params.require(:construction_stock_filling).permit(:construction_stock_id, :quantity, :filling_date, :accepted_by, :filling_location)
    end
end
