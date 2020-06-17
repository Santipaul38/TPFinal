class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  

  def index
    @ships = Ship.all
  end

  # GET /ships/1
  # GET /ships/1.json
  def show
  end

  # GET /ships
  # GET /ships/new
  def new
    @ship = Ship.new
    @currentUser = current_user.id
    @currentGame
  end

  # GET /ships/play
  def play
    @ships = Ship.all.where(:user_id => @currentUser)
  end

  # GET /ships/1/edit
  def edit
  end

  # POST /ships/select
  def select
    
  end

  # POST /ships
  # POST /ships.json
  def create
    @ship = Ship.new(ship_params)


    respond_to do |format|
      if @ship.save
        format.html { redirect_to @ship }
        format.json { render :show, status: :created, location: @ship }

      else
        format.html { render :new }
        format.json { render json: @ship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ships/1
  # PATCH/PUT /ships/1.json
  def update
    respond_to do |format|
      if @ship.update(ship_params)
        format.html { redirect_to @ship, notice: 'Ship was successfully updated.' }
        format.json { render :show, status: :ok, location: @ship }
      else
        format.html { render :edit }
        format.json { render json: @ship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ships/1
  # DELETE /ships/1.json
  def destroy
    @ship.destroy
    respond_to do |format|
      format.html { redirect_to ships_url, notice: 'Ship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ship
      @ship = Ship.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def ship_params
      params.require(:ship).permit(:map_id, :type_id, :posX, :posY, :user_id, :orientation)
    end
end
