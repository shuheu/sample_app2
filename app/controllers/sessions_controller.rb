class SessionsController < ApplicationController

  def new
  end #new 

  def create 
    #ここにユーザ認証する
    # DBから取り出す
    @user = User.find_by(email: params[:session][:email].downcase)
    #認証
    if @user && @user.authenticate(params[:session][:password])
      # 成功
      log_in @user

      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user) # 三項演算子    
      
      # redirect_to @user # user_url(user)
      redirect_back_or @user #デフォルトは個人ページへ、事前にリクエストが保存されていればそこへいく

    else
      #失敗
      flash.now[:danger] = "ログイン失敗 Emailとpasswordの組み合わせが正しくありません。"
      render 'new'
    end #if
   
 
  end #create
  
  def destroy
    log_out if logged_in?
    redirect_to root_url

  end #destroy

end
