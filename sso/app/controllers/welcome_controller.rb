class WelcomeController < ApplicationController
  before_action :authenticate_user! , except: [:verify_token]
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

  def verify_token
  	unless params[:token].nil?
  		token = Token.where(token: params[:token]).first
  		unless token.nil?
  			user = token.user
  			render :json => {success: true, email: user.email, message:"User Found"}

  		else
  			render :json => {success: false, message:"Token doesn't exist"}
  		end

  	else
  		render :json => {success: false, message:"Token doesn't exist"}
  	end
  end
end
