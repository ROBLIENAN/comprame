class SessionsController < ApplicationController
  def home

  end

  def create
  	auth = request.env["omniauth.outh"]
  	user = User.find_by_provider_and_uid(auth["provider"],auth["uid"]) || User.create_with_omniout(auth)
  	session[:user_id] = user.id
  	redirect_to root_url, :notice => "Ingresaste!"
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Sesion cerrada!"
  end
end
