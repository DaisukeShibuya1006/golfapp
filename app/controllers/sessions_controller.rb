class SessionsController < ApplicationController
  # request.env['omniauth.auth']にユーザのTwitter認証情報が格納
  def create
    user_data = request.env['omniauth.auth']
    session[:nickname] = user_data[:info][:nickname]
    redirect_to root_path, notice: 'ログインしました'
  end
end
