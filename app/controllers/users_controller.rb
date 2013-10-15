class UsersController < ApplicationController
  def new
   @user = User.new
  end
  
  def create
    @user = User.new(params[:user])   #passes in the user that was submitted to the params hash
    if @user.save
      flash[:success] = "Thanks for registering"
      redirect_to root_url
    else
      render 'new'
    end
  end
end
