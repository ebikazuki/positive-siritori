class SiritorisController < ApplicationController
  before_action :set_siritori, only: [:show, :edit, :update, :destroy]

  # GET /siritoris
  # GET /siritoris.json
  def index
    @siritoris = Siritori.order(created_at: :DESC).page(params[:page]).per(12)
  end

  # GET /siritoris/1
  # GET /siritoris/1.json
  def show
  end

  # GET /siritoris/new
  def new
    @siritori = Siritori.new
    @siritori_last = Siritori.last
  end

  # GET /siritoris/1/edit
  def edit
  end

  # POST /siritoris
  # POST /siritoris.json
  def create
    @siritori = Siritori.new(siritori_params)

    respond_to do |format|
      if @siritori.save
        format.html { redirect_to @siritori, notice: 'Siritori was successfully created.' }
        format.json { render :show, status: :created, location: @siritori }
      else
        format.html { render :new }
        format.json { render json: @siritori.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /siritoris/1
  # PATCH/PUT /siritoris/1.json
  def update
    respond_to do |format|
      if @siritori.update(siritori_params)
        format.html { redirect_to @siritori, notice: 'Siritori was successfully updated.' }
        format.json { render :show, status: :ok, location: @siritori }
      else
        format.html { render :edit }
        format.json { render json: @siritori.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /siritoris/1
  # DELETE /siritoris/1.json
  def destroy
    @siritori.destroy
    respond_to do |format|
      format.html { redirect_to siritoris_url, notice: 'Siritori was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_siritori
      @siritori = Siritori.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def siritori_params
      params.require(:siritori).permit(:word, :score)
    end
end
