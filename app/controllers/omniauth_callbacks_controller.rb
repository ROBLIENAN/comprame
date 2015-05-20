class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def twitter
		@user = User.from_omniauth_twitter(request.env["omniauth.auth"])
		sign_in_and_redirect @user, :event => :authentication
		#render json: [@user,request.env["omniauth.auth"]]
	end

	def facebook
		@user = User.from_omniauth_facebook(request.env["omniauth.auth"])
		sign_in_and_redirect @user, :event => :authentication
		#render json: [@user,request.env["omniauth.auth"]]
	end

end