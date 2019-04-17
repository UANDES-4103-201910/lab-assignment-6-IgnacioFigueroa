class SessionsController < ApplicationController
	def new
		if cookies[:logged_user]!=nil
			redirect_to "/users/" + current_user
		end
	end

	def create
		email = params[:session][:email]
		password = params[:session][:password]
		user = User.where(email: email, password: password).first()
		if user != nil
			flash[:notice] = "Login Successful"
			cookies["logged_user"] = String(user.id)
			redirect_to "/users/" +String(user.id)
		else
			flash[:notice] = "User or password invalid"
			redirect_to root_url
		end
	end

	def destroy
		cookies["logged_user"] = ""
		redirect_to root_url
	end
end
