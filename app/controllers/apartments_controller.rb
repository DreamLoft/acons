class ApartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  # GET /apartments
  # GET /apartments.json
  def index
    #@apartments = Apartment.all
    @apartments= @project.apartments
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
    #render json: @apartment
  end

  # POST /apartments
  # POST /apartments.json
  def create
    #@apartment = Apartment.new(apartment_params)
    @apartment= @project.apartments.create(apartment_params)
    #@comment = @article.comments.create(comment_params)
    respond_to do |format|
      if @apartment.save
        format.html { redirect_to project_apartments_path(@project), notice: 'Apartment was successfully created.' }
#        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to project_apartment_path(@project,@apartment), notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to project_apartments_path(@project), notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end
    def set_project
      @project= Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:apartment_name, :carpet_area, :build_up, :project_id,:status)
    end
end
