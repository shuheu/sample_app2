class UsersController < ApplicationController
  def new
    @user = User.new 
    # debugger #ここではからのuserをわたしている？
  end
  def show 
    # debugger 
    @user = User.find(params[:id])
    # debugger
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # 成功時のアクション ユーザページまで飛ばす user/#{@params[:id]} とか？
      flash[:success] = "Welcome to the Sample App! ~ようこそ~"
      redirect_to @user
    else
      render 'new'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end



end
