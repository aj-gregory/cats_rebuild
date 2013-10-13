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
    end
  end

  def destroy
  end

end
