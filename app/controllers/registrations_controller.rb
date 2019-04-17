class RegistrationsController < ApplicationController
	def new

	end

	def create
		puts(params)
		user = User.new(name:params[:registrations][:name], last_name:params[:registrations][:last_name], phone:params[:registrations][:phone], email:params[:registrations][:email],
												password:params[:registrations][:password], address:params[:registrations][:address])
		if user.save()
			flash[:notice] = "Registered Successfully"
			redirect_to root_url
		else
			flash[:notice] = "Registration Failed"
			redirect_to registrations_url
		end
	end

end
