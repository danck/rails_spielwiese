class PflegeanbietersController < ApplicationController
  before_action :set_pflegeanbieter, only: [:show, :edit, :update, :destroy]

  # GET /pflegeanbieters
  # GET /pflegeanbieters.json
  def index
    @pflegeanbieters = Pflegeanbieter.all
  end

  # GET /pflegeanbieters/1
  # GET /pflegeanbieters/1.json
  def show
  end

  # GET /pflegeanbieters/new
  def new
    @pflegeanbieter = Pflegeanbieter.new
  end

  # GET /pflegeanbieters/1/edit
  def edit
  end

  # POST /pflegeanbieters
  # POST /pflegeanbieters.json
  def create
    @pflegeanbieter = Pflegeanbieter.new(pflegeanbieter_params)

    respond_to do |format|
      if @pflegeanbieter.save
        format.html { redirect_to @pflegeanbieter, notice: 'Pflegeanbieter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pflegeanbieter }
      else
        format.html { render action: 'new' }
        format.json { render json: @pflegeanbieter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pflegeanbieters/1
  # PATCH/PUT /pflegeanbieters/1.json
  def update
    respond_to do |format|
      if @pflegeanbieter.update(pflegeanbieter_params)
        format.html { redirect_to @pflegeanbieter, notice: 'Pflegeanbieter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pflegeanbieter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pflegeanbieters/1
  # DELETE /pflegeanbieters/1.json
  def destroy
    @pflegeanbieter.destroy
    respond_to do |format|
      format.html { redirect_to pflegeanbieters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pflegeanbieter
      @pflegeanbieter = Pflegeanbieter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pflegeanbieter_params
      params.require(:pflegeanbieter).permit(:name, :bewertung)
    end
end
