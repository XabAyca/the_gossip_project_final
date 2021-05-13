class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Il faut se connecter pour faire marcher ta langue de pute 💋"
      redirect_to new_session_path
    end
  end

end
