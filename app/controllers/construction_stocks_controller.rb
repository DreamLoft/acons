class ConstructionStocksController < ApplicationController
  before_action :set_construction_stock, only: [:show, :edit, :update, :destroy]

  # GET /construction_stocks
  # GET /construction_stocks.json
  def index
    @construction_stocks = ConstructionStock.all
  end

  # GET /construction_stocks/1
  # GET /construction_stocks/1.json
  def show
  end

  # GET /construction_stocks/new
  def new
    @construction_stock = ConstructionStock.new
  end

  # GET /construction_stocks/1/edit
  def edit
  end

  # POST /construction_stocks
  # POST /construction_stocks.json
  def create
    @construction_stock = ConstructionStock.new(construction_stock_params)

    respond_to do |format|
      if @construction_stock.save
        format.html { redirect_to @construction_stock, notice: 'Construction stock was successfully created.' }
        format.json { render :show, status: :created, location: @construction_stock }
      else
        format.html { render :new }
        format.json { render json: @construction_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /construction_stocks/1
  # PATCH/PUT /construction_stocks/1.json
  def update
    respond_to do |format|
      if @construction_stock.update(construction_stock_params)
        format.html { redirect_to @construction_stock, notice: 'Construction stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @construction_stock }
      else
        format.html { render :edit }
        format.json { render json: @construction_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /construction_stocks/1
  # DELETE /construction_stocks/1.json
  def destroy
    @construction_stock.destroy
    respond_to do |format|
      format.html { redirect_to construction_stocks_url, notice: 'Construction stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction_stock
      @construction_stock = ConstructionStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def construction_stock_params
      params.require(:construction_stock).permit(:item_name, :stock_quantity)
    end
end
