class FlightsController < ApplicationController
  before_action :check_for_login, only: [:create, :update, :destroy]

  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
    # @taken_seats = @flight.reservations.pluck(:seat)
    @taken_seats = {}
    @flight.reservations.each do | res |
      @taken_seats.merge! Hash[res.seat, res.user.email]
    end 
    @flight.taken_seats = @taken_seats
  end

  def new
    @flight = Flight.new
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @flight = Flight.find(params[:id])
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    if params[:destination]
      @flights = Flight.where(:origin => params[:origin].capitalize, :destination => params[:destination].capitalize)
    else
      @flights = Flight.where(:origin => params[:origin].capitalize)
    end
  end

  def cities
    @cities = Flight.all.pluck(:origin, :destination).flatten.uniq
  end

  private
    def flight_params
      params.require(:flight).permit(:number, :origin, :destination, :date, :plane_id)
    end
end
