class SessionsController < ApplicationController
	def new
		
	end

	def create
		user=User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id]=user.id
			redirect_to posts_path, notice: "Log In Successful!"
		else
			flash.now.alert="Invalid Email or Password."
			render "new"
		end
	end

	def destroy
		session[:user_id]=nil
		redirect_to root_url, notice: "Log out successful!"
	end
end
