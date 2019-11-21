class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  # before_action :check_for_login, except: [:create]
  # before_action :check_for_admin, only: [:new, :edit, :create, :update]
  skip_before_action :verify_authenticity_token

  def index
    if @current_user.present? && @current_user.admin === true
      @reservations = Reservation.all
    else
      @reservations = Reservation.where(:user_id => @current_user.id)
    end
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def edit
  end

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

  end

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

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:flight_id, :seat)
    end
end
