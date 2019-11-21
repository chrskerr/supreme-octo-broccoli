class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  # before_action :check_for_login, except: [:create]
  # before_action :check_for_admin, only: [:new, :edit, :create, :update]
  skip_before_action :verify_authenticity_token


  # GET /reservations
  # GET /reservations.json
  def index
    if @current_user && @current_user.admin
      @reservations = Reservation.all
    else
      @reservations = Reservation.where(:user_id => @current_user.id)
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    # code to validate user based on email given, and create a new one if none found
    user = User.find_by(:email => params[:email]) 
    if user.present?
      @reservation.user_id = user.id
    else 
      user = User.create :email => params[:email], :name => params[:name]
      @reservation.user_id = user.id
    end

    @reservation.save

    # respond_to do |format|
    #   if @reservation.save
    #     format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
    #     format.json { render 'success' }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @reservation.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:flight_id, :seat)
    end
end
