class ApplicationController < ActionController::Base
	
	protect_from_forgery with: :exception
	helper_method :current_user, :logged_in?

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		!!current_user
	end

	def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to perform that action"
			redirect_to root_path
		end
	end
	
	def check_user_is_logged_in?
		if !current_user
			redirect_to root_path
		else
			puts "#{current_user.username} is logged in"
		end
	end
end