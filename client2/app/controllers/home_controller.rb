# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticated?, except: [:guest]
  def index
    @original_url = request.original_url
  end

  def logout
    session['user'] = nil
    redirect_to '/guest'
  end

  def guest; end
end
