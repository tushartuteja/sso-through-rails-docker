class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	unless params[:redirect_url].nil?
  		begin
  		  token = SecureRandom.hex 
  		end while Token.exists?(token: token)

  		Token.create(user: current_user, token: token)	
  		puts "#{params[:redirect_url]}?token=#{token}"
  		return redirect_to "#{params[:redirect_url]}?token=#{token}"	
  	end
  end
end
