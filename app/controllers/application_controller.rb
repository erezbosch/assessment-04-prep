class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def redirect_unless_logged_in
    redirect_to new_session_url unless current_user
  end

  helper_method :current_user
end
