class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:session][:username], params[:session][:password])

    if @user.nil?
      flash[:errors] = ["Incorrect username or password"]
      redirect_to new_session_url
    else
      session[:session_token] = @user.reset_session_token!
      redirect_to cats_url
    end
  end

  def destsroy
    session[:session_token] = nil
    current_user.reset_session_token!
  end

end
