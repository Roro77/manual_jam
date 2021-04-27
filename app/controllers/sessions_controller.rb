class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sessions[:user_id] = user.id
      redirect_to root_path, notice: "Succesfully logged in"
    else
      render action: :new, notice: "Invalid email or password"
    end
  end

  def destroy
    #sessions[:user_id] = nil
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out Succesfully"
  end
end
