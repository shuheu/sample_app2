class UsersController < ApplicationController
  def new
  end
  def show 
    # debugger 
    @user = User.find(params[:id])
    # debugger
  end

end
