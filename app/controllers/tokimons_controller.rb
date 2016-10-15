class TokimonsController < ApplicationController
  before_action :set_tokimon, only: [:show, :edit, :update, :destroy]

  # GET /tokimons
  # GET /tokimons.json
  def index
    @tokimons = Tokimon.all.order(:id) 
  end

  # GET /tokimons/1
  # GET /tokimons/1.json
  def show
    @roboHashLink = "http://robohash.org/"+@tokimon.id.to_s
    @tokimons = Tokimon.all
  end

  # GET /tokimons/new
  def new
    @trainers = Trainer.all.order(:id)
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
      if @tokimon.name.blank?()
        @tokimon.errors.add(:name)
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }

      elsif @tokimon.save
        format.html { redirect_to @tokimon, notice: 'Tokimon was successfully created.' }
        format.json { render :show, status: :created, location: @tokimon }
        @tokimon.trainer.incrementLevel

      else
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end

    end
    


  end

  # PATCH/PUT /tokimons/1
  # PATCH/PUT /tokimons/1.json
  def update
    @tokimons = Tokimon.all
    @trainers = Trainer.all
    respond_to do |format|
      @tmpTokimon = Tokimon.new(tokimon_params);
      if @tmpTokimon.name.blank?()
        @tokimon.errors.add(:name)
        format.html { render :edit }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }

      elsif @tmpTokimon.trainer.nil?()
        @tokimon.errors.add(:trainer_id)
        format.html { render :edit }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }

      elsif @tokimon.update(tokimon_params)

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

    @tokimon.trainer.decrementLevel


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
      params.require(:tokimon).permit(:trainer_id, :name, :weight, :height, :fly, :fight, :water, :fire, :electric, :freezer, :total)
    end
end
