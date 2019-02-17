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
      log_in @user
      flash[:success] = "Welcome to the Sample App! ~ようこそ~"
      
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "更新を保存しました。"
      redirect_to @user
    else
      render 'edit' #edit ページを再表示。
    end
  
  end




  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end



end
