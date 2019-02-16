class SessionsController < ApplicationController

  def new
  end #new 

  def create 
    #ここにユーザ認証する
    # DBから取り出す
    user = User.find_by(email: params[:session][:email].downcase)
    #認証
    if user && user.authenticate(params[:session][:password])
      # 成功
      log_in user
      remember user
      redirect_to user # user_url(user)
    else
      #失敗
      flash.now[:danger] = "ログイン失敗 Emailとpasswordの組み合わせが正しくありません。"
      render 'new'
    end #if

    
    
    
    
 
  end #create
  
  def destroy
    log_out
    redirect_to root_url

  end #destroy

end
