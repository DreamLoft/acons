class ConstructionStockIssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_construction_stock_issue, only: [:show, :edit, :update, :destroy]

  # GET /construction_stock_issues
  # GET /construction_stock_issues.json
  def index
    @construction_stock_issues = ConstructionStockIssue.all
  end

  # GET /construction_stock_issues/1
  # GET /construction_stock_issues/1.json
  def show
  end

  # GET /construction_stock_issues/new
  def new
    @construction_stock_issue = ConstructionStockIssue.new
  end

  # GET /construction_stock_issues/1/edit
  def edit
  end

  # POST /construction_stock_issues
  # POST /construction_stock_issues.json
  def create
    @construction_stock_issue = ConstructionStockIssue.new(construction_stock_issue_params)

    respond_to do |format|
      if @construction_stock_issue.save
        construction_stock= @construction_stock_issue.construction_stock
        construction_stock.stock_quantity = construction_stock.stock_quantity -  @construction_stock_issue.quanity
        construction_stock.save
        format.html { redirect_to @construction_stock_issue, notice: 'Construction stock issue was successfully created.' }
        format.json { render :show, status: :created, location: @construction_stock_issue }
      else
        format.html { render :new }
        format.json { render json: @construction_stock_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /construction_stock_issues/1
  # PATCH/PUT /construction_stock_issues/1.json
  def update
    respond_to do |format|
      if @construction_stock_issue.update(construction_stock_issue_params)
        format.html { redirect_to @construction_stock_issue, notice: 'Construction stock issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @construction_stock_issue }
      else
        format.html { render :edit }
        format.json { render json: @construction_stock_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /construction_stock_issues/1
  # DELETE /construction_stock_issues/1.json
  def destroy
    @construction_stock_issue.destroy
    respond_to do |format|
      format.html { redirect_to construction_stock_issues_url, notice: 'Construction stock issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction_stock_issue
      @construction_stock_issue = ConstructionStockIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def construction_stock_issue_params
      params.require(:construction_stock_issue).permit(:construction_stock_id, :quanity, :issue_date, :issued_to)
    end
end
