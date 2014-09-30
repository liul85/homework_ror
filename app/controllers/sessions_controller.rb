class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user and user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome #{user.email}"
			redirect_to user
		else
			flash[:error] = "Wrong email or password. Please try again."
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
