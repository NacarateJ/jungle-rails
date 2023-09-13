class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.find_by_email(params[:user][:email])

    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:user][:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:id] = @user.id
      redirect_to products_path
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to new_sessions_path
    end

  end

  def destroy
    session[:id] = nil
    redirect_to new_sessions_path
  end

end
