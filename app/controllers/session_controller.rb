class SessionController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by :email => params[:email]
      if user.present?
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash[:error] = "Invalid email address or password" # temporary session variable that only shows for the next page, then clears itself
        redirect_to login_path
      end
  
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end
end