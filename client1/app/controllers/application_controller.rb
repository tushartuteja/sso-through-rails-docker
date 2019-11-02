require 'httparty'
class ApplicationController < ActionController::Base
	def authenticated?
		puts session[:user]
		if session.nil? or session[:user].nil? 
			if params[:token].nil? 
				return redirect_to "http://localhost:3000?redirect_url=#{request.original_url}"
			else
				verify_url =  "http://sso:3000/welcome/verify_token?token=#{params[:token]}"
				puts "redirect_url", verify_url
				response = HTTParty.get(verify_url)
				if response["success"] = true
					session["user"] = response["email"]
				else
					return redirect_to "http://localhost:3000?redirect_url=#{request.original_url}"

				end
			end
		end
	end

	
end
