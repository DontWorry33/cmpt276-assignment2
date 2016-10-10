class TokimonsController < ApplicationController
  before_action :set_tokimon, only: [:show, :edit, :update, :destroy]

  # GET /tokimons
  # GET /tokimons.json
  def index
    @tokimons = Tokimon.all
  end

  # GET /tokimons/1
  # GET /tokimons/1.json
  def show
    @roboHashLink = "http://robohash.org/"+@tokimon.id.to_s
  end

  # GET /tokimons/new
  def new
    @trainers = Trainer.all
    @tokimon = Tokimon.new
  end

  # GET /tokimons/1/edit
  def edit
    @trainers = Trainer.all
  end

  # POST /tokimons
  # POST /tokimons.json
  def create
    @trainers = Trainer.all
    @tokimon = Tokimon.new(tokimon_params)
    respond_to do |format|

      if @tokimon.save
        format.html { redirect_to @tokimon, notice: 'Tokimon was successfully created.' }
        format.json { render :show, status: :created, location: @tokimon }
      else
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    end
    
    if @tokimon.trainer.tokimons.length % 3 == 0
      @tokimon.trainer.level += 1;
      @tokimon.trainer.save
    end

  end

  # PATCH/PUT /tokimons/1
  # PATCH/PUT /tokimons/1.json
  def update
    @tokimons = Tokimon.all
    @trainers = Trainer.all
    respond_to do |format|
      if @tokimon.update(tokimon_params)
        format.html { redirect_to @tokimon, notice: 'Tokimon was successfully updated.' }
        format.json { render :show, status: :ok, location: @tokimon }
      else
        format.html { render :edit }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tokimons/1
  # DELETE /tokimons/1.json
  def destroy
    @tokimon.destroy
    respond_to do |format|
      format.html { redirect_to tokimons_url, notice: 'Tokimon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tokimon
      @tokimon = Tokimon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tokimon_params
      params.require(:tokimon).permit(:trainer_id, :name, :weight, :height, :fly, :fight, :water, :fire, :electric, :freeze, :total)
    end
end
