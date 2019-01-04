class PasswordResetsController < ApplicationController
  # Method from: http://github.com/binarylogic/authlogic_example/blob/master/app/controllers/application_controller.rb
#  before_action :require_or_load
  before_action :load_user_using_perishable_token, :only => [ :edit, :update ]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you"
      redirect_to root_path
    else
      flash.now[:error] = "No user was found with email address #{params[:email]}"
      render :action => :new
    end
  end

  def edit
    load_user_using_perishable_token
    @token = @user.perishable_token
  end

  def update
    @user.password = params[:password]
    puts params[:password]
    # Only if your are using password confirmation
    # @user.password_confirmation = params[:password]

    # Use @user.save_without_session_maintenance instead if you
    # don't want the user to be signed in automatically.
    if @user.save
      flash[:success] = "Your password was successfully updated"
      redirect_to @user
    else
      render :action => :edit
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  private

  def load_user_using_perishable_token
    #
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error] = "We're sorry, but we could not locate your account"
      redirect_to root_url
    end
  end
end
