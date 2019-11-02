class ApplicationController < ActionController::Base
	def authenticated?
		if session.nil? or session[:user].nil? 
			if params[:token].nil? 
				return redirect_to "http://localhost:3000?redirect_url=#{request.original_url}"
			else
				# verify token 
				# set session 
				# or redirect to sso
			end
		end
	end
end
