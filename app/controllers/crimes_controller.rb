class CrimesController < ApplicationController
  before_action :set_crime, only: %i[ show edit update destroy ]

  # controller for line data look up
  def  line_data
    render json: Crime.find_line_data(params[:state_id],params[:crime_name])
  end
  # GET /crimes or /crimes.json
  def index
    @crimes = Crime.all
  end

  # GET /crimes/1 or /crimes/1.json
  def show
  end

  # GET /crimes/new
  def new
    @crime = Crime.new
  end

  # GET /crimes/1/edit
  def edit
  end

  # POST /crimes or /crimes.json
  def create
    @crime = Crime.new(crime_params)

    respond_to do |format|
      if @crime.save
        format.html { redirect_to @crime, notice: "Crime was successfully created." }
        format.json { render :show, status: :created, location: @crime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crimes/1 or /crimes/1.json
  def update
    respond_to do |format|
      if @crime.update(crime_params)
        format.html { redirect_to @crime, notice: "Crime was successfully updated." }
        format.json { render :show, status: :ok, location: @crime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crimes/1 or /crimes/1.json
  def destroy
    @crime.destroy
    respond_to do |format|
      format.html { redirect_to crimes_url, notice: "Crime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crime
      @crime = Crime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crime_params
      params.require(:crime).permit(:state_id, :crime_name, :pop, :asian_pop, :hawaiian, :black, :american_indian, :unknown, :white, :year)
    end
end
