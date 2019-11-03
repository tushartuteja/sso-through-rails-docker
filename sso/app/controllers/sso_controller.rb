# frozen_string_literal: true

class SsoController < ApplicationController
  before_action :authenticate_user!, except: [:verify_token]
  def index
    unless params[:redirect_url].nil?
      begin
        token = SecureRandom.hex
      end while Token.exists?(token: token)

      Token.create(user: current_user, token: token)
      puts "#{params[:redirect_url]}?token=#{token}"
      redirect_to "#{params[:redirect_url]}?token=#{token}"
    end
  end

  def verify_token
    if params[:token].nil?
      render json: { success: false, message: "Token doesn't exist" }
    else
      token = Token.where(token: params[:token]).first
      if token.nil?
        render json: { success: false, message: "Token doesn't exist" }
      else
        user = token.user
        render json: { success: true, email: user.email, message: 'User Found' }

      end

     end
  end
end
