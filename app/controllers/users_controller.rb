class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign up" 
  end
  
  def create
    #Inspect User object at time of creation
    #raise params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user, :flash => {:success => "Welcome to the sample app"}
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
