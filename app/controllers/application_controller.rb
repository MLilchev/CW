class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order


  def current_order
      if !session[:order_id].nil?
        Order.find(session[:order_id])
      else
        Order.new
      end
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  helper_method :current_user_session, :current_user

end
