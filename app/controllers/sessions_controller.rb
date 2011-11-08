class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    
    if user.nil?
      flash.now[:error] = "Invalid username/password combination"
      @title = "Sign in"
      render 'new'
    else
      #Handle Successful signin
    end
  end
  
  def destroy
  end

end
