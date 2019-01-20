class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show 
    # debugger 
    @user = User.find(params[:id])
    # debugger
  end

end
